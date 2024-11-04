import { useEffect } from "react";

export function useInterval(time: number, cb: () => unknown) {
  useEffect(() => {
    const interval = setInterval(cb, time);

    return () => {
      clearInterval(interval);
    };
  }, [cb, time]);
}
