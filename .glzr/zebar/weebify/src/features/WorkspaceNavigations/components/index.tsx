import { useZebar } from "@/common/context/zebar/use-zebar";
import { FC } from "react";
import { WorkspaceButton } from "./WorkspaceButton";

export const WorkspaceNavigations: FC = () => {
  const output = useZebar();

  return (
    <div className="h-full">
      {output.glazewm && (
        <div className="flex items-center h-full gap-1">
          {output.glazewm.currentWorkspaces.map((workspace) => (
            <WorkspaceButton workspace={workspace} key={workspace.id} />
          ))}
        </div>
      )}
    </div>
  );
};
