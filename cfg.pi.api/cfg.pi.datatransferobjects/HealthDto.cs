﻿namespace cfg.pi.datatransferobjects
{
    public class HealthDto
    {
        public string Enironment { get; set; }

        public List<DeviceTempatureDto> Tempatures { get; set; }

        public int ProcessorCount { get; set; }

        public List<DeviceProcessorDto> Processors { get; set; }

        public int SystemUptime { get; set; }
    }
}