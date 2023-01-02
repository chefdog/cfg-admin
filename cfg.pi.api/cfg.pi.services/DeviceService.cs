using cfg.pi.datatransferobjects;

namespace cfg.pi.services
{
    public interface DeviceService
    {
        Task<List<HealthDto>> GetDevices();
    }
}
