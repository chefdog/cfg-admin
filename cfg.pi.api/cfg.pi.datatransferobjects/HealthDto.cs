namespace cfg.pi.datatransferobjects
{
    public class HealthDto
    {
        public string Environment { get; set; }

        public string SystemName { get; set; }

        public List<DeviceTempatureDto> Tempatures { get; set; }

        public int ProcessorCount { get; set; }

        public List<DeviceProcessorDto> Processors { get; set; }

        public int SystemUptime { get; set; }
    }
}