import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { WidgetContainer } from "@/features/WidgetContainer/components";
import { type FC } from "react";
import { IoCalendarOutline } from "react-icons/io5";
import { WiTime2 } from "react-icons/wi";

export const DateTimeMonitor: FC = () => {
  const output = useZebar();

  return (
    <WidgetContainer>
      <Button asChild className="gap-1">
        <div>
          <IoCalendarOutline />
          <span className="text-xs">{output.date?.formatted}</span>
        </div>
      </Button>

      <div className="w-px bg-border" />

      <Button asChild>
        <span className="text-xs">{output.day?.formatted}</span>
      </Button>

      <div className="w-px bg-border" />

      <Button asChild className="gap-1">
        <div>
          <WiTime2 />
          <span className="text-xs">{output.time?.formatted}</span>
        </div>
      </Button>
    </WidgetContainer>
  );
};
