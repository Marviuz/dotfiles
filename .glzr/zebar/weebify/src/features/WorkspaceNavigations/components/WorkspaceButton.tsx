import { Button } from "@/common/components/Button";
import { useZebar } from "@/common/context/zebar/use-zebar";
import { Workspace } from "glazewm";
import { FC } from "react";
import { formatWorkspaceState } from "../utils/format-workspace-state";

type WorkspaceButtonProps = { workspace: Workspace };

export const WorkspaceButton: FC<WorkspaceButtonProps> = ({ workspace }) => {
  const output = useZebar();

  return (
    <Button
      className="data-[state*=focused]:bg-primary data-[state*=focused]:text-primary-foreground"
      variant="ghost"
      size="icon"
      data-state={formatWorkspaceState(
        workspace.hasFocus ? "focused" : null,
        workspace.isDisplayed ? "displayed" : null,
      )}
      onClick={() =>
        output.glazewm?.runCommand(`focus --workspace ${workspace.name}`)
      }
    >
      {workspace.displayName ?? workspace.name}
    </Button>
  );
};
