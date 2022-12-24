using cfg.pi.datatransferobjects;
using Iot.Device.CpuTemperature;

namespace cfg.pi.services.DeviceServices
{
    public class DeviceServiceImpl : DeviceService
    {
        public async Task<HealthDto> GetDeviceInformation()
        {
            var healthDto = new HealthDto();
            healthDto.Tempatures = GetDeviceTempature();

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
                        // Console.WriteLine($"Temperature from {entry.Sensor.ToString()}: {entry.Temperature.DegreesCelsius} °C");
                        result.Add(new DeviceTempatureDto { SensorName = entry.Sensor.ToString(), Tempature = entry.Temperature.DegreesCelsius });
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
    }
}