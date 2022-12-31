using cfg.pi.datatransferobjects;
using Iot.Device.CpuTemperature;

namespace cfg.pi.services.DeviceServices
{
    public class DeviceServiceImpl : DeviceService
    {
        

        public async Task<List<HealthDto>> GetDevices() {
            List<HealthDto> result = new List<HealthDto> {
                await GetDeviceInformation()
            };
            return result;
        }

        public async Task<HealthDto> GetDeviceInformation()
        {
            var healthDto = new HealthDto();
            healthDto.Tempatures = GetDeviceTempature();
            healthDto.Processors = GetDeviceProcessorsInformation();
            healthDto.ProcessorCount = Environment.ProcessorCount;
            healthDto.SystemUptime = Environment.TickCount;
            healthDto.MachineName = Environment.MachineName;
            healthDto.MemoryAmount = Environment.WorkingSet;
            healthDto.OSVersion = Environment.OSVersion.VersionString;
            return healthDto;
        }

        private List<DeviceTempatureDto> GetDeviceTempature()
        {
            var result = new List<DeviceTempatureDto>();
            var cpuTemperature = new CpuTemperature();
            if (cpuTemperature.IsAvailable) {
                var temperature = cpuTemperature.ReadTemperatures();
                foreach (var entry in temperature)
                {
                    if (!double.IsNaN(entry.Temperature.DegreesCelsius))
                    {
                        result.Add(new DeviceTempatureDto { 
                            SensorName = entry.Sensor.ToString(), 
                            Tempature = entry.Temperature.DegreesCelsius,
                            TempatureInCelcius = true,
                        });
                    }
                    else
                    {
                        // Console.WriteLine("Unable to read Temperature.");
                        // throw custom exception here
                    }
                }
            }

            return result;
        }

        private List<DeviceProcessorDto> GetDeviceProcessorsInformation() {
            var cpuCount = Environment.ProcessorCount;
            
            return new List<DeviceProcessorDto>
            {

                new DeviceProcessorDto
                {
                      
                }
            };
        }
    }
}