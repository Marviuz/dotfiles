import { useEffect, useState, type FC, type ReactNode } from "react";
import { providers, zebarContext } from "./use-zebar";

type ZebarProviderProps = {
  children?: ReactNode;
};

export const ZebarProvider: FC<ZebarProviderProps> = ({ children }) => {
  const [output, setOutput] = useState(providers.outputMap);

  useEffect(() => {
    providers.onOutput(() => setOutput(providers.outputMap));
  }, []);

  return (
    <zebarContext.Provider value={output}>{children}</zebarContext.Provider>
  );
};
