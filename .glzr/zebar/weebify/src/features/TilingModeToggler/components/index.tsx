import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { FC } from "react";
import { HiArrowsRightLeft, HiArrowsUpDown } from "react-icons/hi2";

export const TilingDirectionToggler: FC = () => {
  const output = useZebar();

  return output.glazewm ? (
    <Button
      variant="ghost"
      size="icon"
      onClick={() => {
        output.glazewm?.runCommand("toggle-tiling-direction");
      }}
    >
      {output.glazewm.tilingDirection === "horizontal" ? (
        <HiArrowsRightLeft />
      ) : (
        <HiArrowsUpDown />
      )}
    </Button>
  ) : null;
};
