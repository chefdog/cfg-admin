namespace cfg.pi.datatransferobjects
{
    public class HealthDto
    {
        public string Enironment { get; set; }

        public List<DeviceTempatureDto> Tempatures { get; set; }
    }
}