import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { FC } from "react";

export const BindingMode: FC = () => {
  const output = useZebar();

  return output.glazewm
    ? output.glazewm.bindingModes.map((mode) => (
        <Button asChild key={mode.displayName}>
          <div>{mode.displayName ?? mode.name}</div>
        </Button>
      ))
    : null;
};
