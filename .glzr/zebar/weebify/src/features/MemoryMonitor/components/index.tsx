import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { cn } from "@/common/utils/cn";
import { FC } from "react";
import { BsMemory } from "react-icons/bs";

export const MemoryMonitor: FC = () => {
  const output = useZebar();

  const usage = output.memory?.usage;

  return usage ? (
    <Button
      className="gap-1"
      variant="ghost"
      onClick={() => {
        output.glazewm?.runCommand("shell-exec taskmgr");
      }}
    >
      <BsMemory />
      <span className={cn("text-xs", usage > 85 && "text-destructive")}>
        {Math.round(usage)}%
      </span>
    </Button>
  ) : null;
};
