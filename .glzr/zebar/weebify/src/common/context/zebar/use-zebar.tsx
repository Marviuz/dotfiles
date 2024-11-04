import { createContext, useContext } from "react";
import * as zebar from "zebar";

export const providers = zebar.createProviderGroup({
  network: { type: "network" },
  glazewm: { type: "glazewm" },
  cpu: { type: "cpu" },
  date: { type: "date", formatting: "MMM. d yyyy" },
  time: { type: "date", formatting: "t" },
  day: { type: "date", formatting: "EEE" },
  memory: { type: "memory" },
  weather: { type: "weather" },
});

export const zebarContext = createContext<
  (typeof providers)["outputMap"] | null
>(null);

export function useZebar() {
  const ctx = useContext(zebarContext);

  if (!ctx) {
    throw new Error("useZebar must be used within a ZebarProvider");
  }

  return ctx;
}
