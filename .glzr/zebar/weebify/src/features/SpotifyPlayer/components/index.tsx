import { Button } from "@/common/components/Button";
import { useSpotify } from "../service/spotify";
import { useEffect, useMemo } from "react";

export const SpotifyPlayer = () => {
  const { currentSong, updateSong, skipSongMutation, togglePlayingMutation } =
    useSpotify();

  const intervalId: NodeJS.Timeout[] = useMemo(() => [], []);

  useEffect(() => {
    const updateAndSetInterval = async () => {
      await updateSong();
      const tempId = setInterval(async () => {
        await updateSong();
      }, 1000 * 10);
      intervalId.push(tempId);
    };

    updateAndSetInterval();

    return () => {
      for (const id of intervalId) {
        clearInterval(id);
      }
    };
  }, [intervalId, updateSong]);

  return (
    <div className="flex gap-2 items-center">
      <pre>{JSON.stringify(currentSong, null, 2)}</pre>
      <Button
        onClick={() => {
          togglePlayingMutation();
        }}
      >
        Play/Pause
      </Button>
      <Button onClick={() => skipSongMutation()}>Skip</Button>
    </div>
  );
};
