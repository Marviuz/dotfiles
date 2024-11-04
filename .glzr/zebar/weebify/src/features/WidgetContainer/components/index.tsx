import { FC, ReactNode } from "react";

type WidgetContainerProps = {
  children: ReactNode;
};

export const WidgetContainer: FC<WidgetContainerProps> = ({ children }) => {
  return (
    <div className="border rounded-full">
      <div className="flex gap-1 [&>button]:rounded-none [&>*:first-child]:rounded-l-full [&>*:last-child]:rounded-r-full">
        {children}
      </div>
    </div>
  );
};
