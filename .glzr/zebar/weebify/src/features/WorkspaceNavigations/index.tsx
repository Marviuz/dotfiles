import { useZebar } from "@/common/context/zebar/use-zebar";
import { FC } from "react";
import { Workspace } from "glazewm";
import { WorkspaceButton } from "./components/WorkspaceButton";

export const WorkspaceButtons: FC<Workspace> = () => {
  const output = useZebar();

  return (
    output.glazewm && (
      <div className="workspaces">
        {output.glazewm.currentWorkspaces.map((workspace) => (
          <WorkspaceButton
            data-state={`${workspace.hasFocus ? "focused" : ""}`}
            data-displayed={workspace.isDisplayed ? "displayed" : ""}
            onClick={() =>
              output.glazewm?.runCommand(`focus --workspace ${workspace.name}`)
            }
            key={workspace.name}
          >
            {workspace.displayName ?? workspace.name}
          </WorkspaceButton>
        ))}
      </div>
    )
  );
};
