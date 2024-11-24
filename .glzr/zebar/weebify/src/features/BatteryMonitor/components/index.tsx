import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { cn } from "@/common/utils/cn";
import { FC, useMemo } from "react";
import {
  LuBatteryFull,
  LuBatteryLow,
  LuBatteryMedium,
  LuBatteryWarning,
} from "react-icons/lu";
import { ChargingBatteryIcon } from "./BatteryIcon";

export const BatteryMonitor: FC = () => {
  const output = useZebar();

  const chargePercent = output.battery?.chargePercent;
  const healthPercent = output.battery?.healthPercent;
  const isCharging = output.battery?.isCharging;
  const percent = chargePercent || healthPercent || 0;

  const Comp = useMemo(() => {
    if (isCharging) return ChargingBatteryIcon;

    if (percent <= 15) return LuBatteryWarning;
    if (percent <= 30) return LuBatteryLow;
    if (percent <= 50) return LuBatteryMedium;

    return LuBatteryFull;
  }, [isCharging, percent]);

  return chargePercent ? (
    <Button className="gap-1" variant="ghost">
      <Comp />
      <span
        className={cn(
          "text-xs",
          percent > 85 && !isCharging && "text-destructive",
        )}
      >
        {Math.round(chargePercent)}%
      </span>
    </Button>
  ) : null;
};
