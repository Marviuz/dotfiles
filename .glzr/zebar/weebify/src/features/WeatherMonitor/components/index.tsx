import { useZebar } from "@/common/context/zebar/use-zebar";
import { WeatherIcon } from "./WeatherIcon";
import { Button } from "@/common/components/Button";

export const WeatherMonitor = () => {
  const output = useZebar();

  return output.weather ? (
    <Button asChild>
      <div>
        <WeatherIcon weatherStatus={output.weather.status} />
        <span className="text-xs">
          {Math.round(output.weather.celsiusTemp)}°C
        </span>
      </div>
    </Button>
  ) : null;
};
