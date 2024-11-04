import { FC } from "react";
import { IconBaseProps } from "react-icons";
import {
  TiWeatherCloudy,
  TiWeatherDownpour,
  TiWeatherNight,
  TiWeatherPartlySunny,
  TiWeatherShower,
  TiWeatherSnow,
  TiWeatherStormy,
  TiWeatherSunny,
} from "react-icons/ti";
import { type WeatherStatus } from "zebar";

type WeatherIconProps = IconBaseProps & {
  weatherStatus: WeatherStatus;
};

export const WeatherIcon: FC<WeatherIconProps> = ({
  weatherStatus,
  ...props
}) => {
  switch (weatherStatus) {
    case "clear_day":
      return <TiWeatherSunny {...props} />;
    case "clear_night":
      return <TiWeatherNight {...props} />;
    case "cloudy_day":
      return <TiWeatherPartlySunny {...props} />;
    case "cloudy_night":
      return <TiWeatherCloudy {...props} />;
    case "light_rain_day":
      return <TiWeatherShower {...props} />;
    case "light_rain_night":
      return <TiWeatherShower {...props} />;
    case "heavy_rain_day":
      return <TiWeatherDownpour {...props} />;
    case "heavy_rain_night":
      return <TiWeatherDownpour {...props} />;
    case "snow_day":
      return <TiWeatherSnow {...props} />;
    case "snow_night":
      return <TiWeatherSnow {...props} />;
    case "thunder_day":
      return <TiWeatherStormy {...props} />;
    case "thunder_night":
      return <TiWeatherStormy {...props} />;
  }
};
