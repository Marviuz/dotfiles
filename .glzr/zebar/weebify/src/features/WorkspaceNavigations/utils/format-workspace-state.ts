type FormatWorkspaceStateArguments = ["focused" | null, "displayed" | null];

export function formatWorkspaceState(...args: FormatWorkspaceStateArguments) {
  return args.filter(Boolean).join("-");
}
