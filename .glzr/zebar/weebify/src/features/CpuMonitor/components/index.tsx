import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { cn } from "@/common/utils/cn";
import { FC } from "react";
import { LuCpu } from "react-icons/lu";

export const CpuMonitor: FC = () => {
  const output = useZebar();

  const usage = output.cpu?.usage;

  return usage ? (
    <Button
      className="gap-1"
      variant="ghost"
      onClick={() => {
        output.glazewm?.runCommand("shell-exec taskmgr");
      }}
    >
      <LuCpu />
      <span className={cn("text-xs", usage > 85 && "text-destructive")}>
        {Math.round(usage)}%
      </span>
    </Button>
  ) : null;
};
