import { useInterval } from "@/common/hooks/use-interval";
import { CamellyaIcon } from "@/common/icons/characters/Camellya";
import { ElysiaIcon } from "@/common/icons/characters/Elysia";
import { GanyuIcon } from "@/common/icons/characters/Ganyu";
import { HanabiIcon } from "@/common/icons/characters/Hanabi";
import { FC, useState } from "react";

const icons = [GanyuIcon, HanabiIcon, ElysiaIcon, CamellyaIcon];

export const IconRotator: FC = () => {
  const [index, setIndex] = useState(0);
  const Comp = icons[index];

  useInterval(5000, () => {
    setIndex((currentIndex) => {
      if (!icons[currentIndex + 1]) return 0;
      return currentIndex + 1;
    });
  });

  return (
    <div className="size-10 ">
      <div className="grid place-items-center">
        <Comp />
      </div>
    </div>
  );
};
