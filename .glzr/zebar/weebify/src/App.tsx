import { ReactQueryProvider } from "./common/context/react-query";
import { ZebarProvider } from "./common/context/zebar/provider";
import { BatteryMonitor } from "./features/BatteryMonitor/components";
import { CpuMonitor } from "./features/CpuMonitor/components";
import { MemoryMonitor } from "./features/MemoryMonitor/components";
import { NetworkMonitor } from "./features/NetworkMonitor/components";
import { TilingDirectionToggler } from "./features/TilingModeToggler/components";
// import { SpotifyPlayer } from "./features/SpotifyPlayer/components";
import { BindingMode } from "./features/BindingMode/components";
import { IconRotator } from "./features/IconRotator/components";
import { DateTimeMonitor } from "./features/TimeMonitor/components";
import { WeatherMonitor } from "./features/WeatherMonitor/components";
import { WidgetContainer } from "./features/WidgetContainer/components";
import { WorkspaceNavigations } from "./features/WorkspaceNavigations/components";

function App() {
  return (
    <ReactQueryProvider>
      <ZebarProvider>
        <div className="h-full bg-background/75">
          <div className="px-4 h-full">
            <div className="flex h-full gap-1 justify-between items-center">
              <div className="flex gap-6 items-center">
                <IconRotator />
                <WorkspaceNavigations />
              </div>

              <div className="flex gap-2 items-center">
                <BindingMode />
                <TilingDirectionToggler />
                {/* <SpotifyPlayer /> */}
                <WidgetContainer>
                  <CpuMonitor />
                  <MemoryMonitor />
                  <NetworkMonitor />
                </WidgetContainer>
                <WidgetContainer>
                  <WeatherMonitor />
                </WidgetContainer>
                <DateTimeMonitor />
                <WidgetContainer>
                  <BatteryMonitor />
                </WidgetContainer>
              </div>
            </div>
          </div>
        </div>
      </ZebarProvider>
    </ReactQueryProvider>
  );
}

export default App;
