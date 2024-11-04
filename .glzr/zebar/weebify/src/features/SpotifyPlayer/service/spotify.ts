import { env } from "@/../.env";
import { QueryKeys } from "@/common/consts/query-keys";
import { useMutation, useQuery } from "@tanstack/react-query";
import axios from "axios";
import { z } from "zod";

const $ = axios.create({
  baseURL: "https://api.spotify.com/v1",
});

type AuthArguments = {
  accessToken: string;
};

const RefreshTokenResponse = z.object({
  access_token: z.string(),
  token_type: z.string(),
  expires_in: z.number(),
  refresh_token: z.string(),
  scope: z.string(),
});

type RefreshTokenResponseType = z.infer<typeof RefreshTokenResponse>;

async function refreshAccessToken() {
  const { data } = await axios.post(
    "https://accounts.spotify.com/api/token",
    new URLSearchParams({
      grant_type: "refresh_token",
      refresh_token: env.SPOTIFY_REFRESH_TOKEN,
      client_id: env.SPOTIFY_CLIENT_ID,
      client_secret: env.SPOTIFY_CLIENT_SECRET,
    }),
    {
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    },
  );

  return RefreshTokenResponse.parse(data);
}

const SkipSongResponse = z.object({});

type SkipSongResponseType = z.infer<typeof SkipSongResponse>;

async function skipSong(args: AuthArguments) {
  const { data } = await $.post("/me/player/next", {
    headers: {
      Authorization: `Bearer ${args.accessToken}`,
    },
  });

  return data;
}

const GetCurrentSongResponse = z.object({
  is_playing: z.boolean(),
});

type GetCurrentSongResponseType = z.infer<typeof GetCurrentSongResponse>;

async function getCurrentSong({ accessToken }: AuthArguments) {
  const { data } = await $.get("/me/player/currently-playing", {
    headers: {
      Authorization: `Bearer ${accessToken}`,
    },
  });

  return GetCurrentSongResponse.parse(data);
}

const TogglePlayingResponse = z.object({});

type TogglePlayingResponseType = z.infer<typeof TogglePlayingResponse>;

async function togglePlaying(args: AuthArguments) {
  console.log("TRIGGERED TOH");
  try {
    const { is_playing } = await getCurrentSong(args);
    const { data } = await $.put(
      `/me/player/${is_playing ? "pause" : "play"}`,
      {
        headers: {
          Authorization: `Bearer ${args.accessToken}`,
        },
      },
    );
    console.log("TOGGLE PLAYING", data);

    return TogglePlayingResponse.parse(data);
  } catch (e) {
    console.log("error", e);
    throw e;
  }
}

export function useSpotify() {
  const { mutateAsync } = useMutation({
    mutationFn: () => refreshAccessToken(),
  });

  const { mutate: togglePlayingMutation } = useMutation({
    mutationFn: async () => {
      console.log("gumana?");
      const { access_token } = await mutateAsync();
      console.log(access_token);
      return togglePlaying({ accessToken: access_token });
    },
  });

  const { mutate: skipSongMutation } = useMutation({
    mutationFn: async () => {
      const { access_token } = await mutateAsync();
      return skipSong({ accessToken: access_token });
    },
  });

  const { data: currentSong, refetch: updateSong } = useQuery({
    queryKey: [QueryKeys.currentSong],
    queryFn: async () => {
      const { access_token } = await mutateAsync();
      return getCurrentSong({ accessToken: access_token });
    },
  });

  return {
    togglePlayingMutation,
    skipSongMutation,
    currentSong,
    updateSong,
  };
}
