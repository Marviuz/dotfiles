import { useEffect, useState } from "react";
import {
  LuBattery,
  LuBatteryFull,
  LuBatteryLow,
  LuBatteryMedium,
} from "react-icons/lu";

const icons = [LuBattery, LuBatteryLow, LuBatteryMedium, LuBatteryFull];

export const ChargingBatteryIcon = () => {
  const [index, setIndex] = useState(0);

  const Icon = icons[index];

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((currentIndex) => {
        if (currentIndex === icons.length - 1) return 0;
        return currentIndex + 1;
      });
    }, 500);

    return () => {
      clearInterval(interval);
    };
  }, []);

  return <Icon />;
};
