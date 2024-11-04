import { FC } from "react";
import { IconBaseProps } from "react-icons";
import { CgEthernet } from "react-icons/cg";
import {
  MdSignalWifiStatusbar1Bar,
  MdSignalWifiStatusbar2Bar,
  MdSignalWifiStatusbar3Bar,
  MdSignalWifiStatusbar4Bar,
  MdSignalWifiStatusbarNotConnected,
  MdSignalWifiStatusbarNull,
} from "react-icons/md";
import { NetworkOutput } from "zebar";

type NetworkIconProps = IconBaseProps & {
  networkOutput: NetworkOutput;
};

export const NetworkIcon: FC<NetworkIconProps> = ({ networkOutput }) => {
  const signalStrength = networkOutput.defaultGateway?.signalStrength ?? 0;

  switch (networkOutput.defaultInterface?.type) {
    case "ethernet":
      return <CgEthernet />;
    case "wifi":
      if (signalStrength >= 80) {
        return <MdSignalWifiStatusbar4Bar />;
      } else if (signalStrength >= 65) {
        return <MdSignalWifiStatusbar3Bar />;
      } else if (signalStrength >= 40) {
        return <MdSignalWifiStatusbar2Bar />;
      } else if (signalStrength >= 25) {
        return <MdSignalWifiStatusbar1Bar />;
      } else {
        return <MdSignalWifiStatusbarNull />;
      }
    default:
      return <MdSignalWifiStatusbarNotConnected />;
  }
};
