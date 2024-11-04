import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { NetworkIcon } from "./NetworkIcon";
import { FC } from "react";

export const NetworkMonitor: FC = () => {
  const output = useZebar();

  return output.network ? (
    <Button asChild>
      <div>
        <NetworkIcon networkOutput={output.network} />
        <span className="text-xs">
          {output.network.defaultGateway?.ssid ?? "Connected"}
        </span>
      </div>
    </Button>
  ) : null;
};
