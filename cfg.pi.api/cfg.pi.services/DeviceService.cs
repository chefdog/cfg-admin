using cfg.pi.datatransferobjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cfg.pi.services
{
    public interface DeviceService
    {
        Task<HealthDto> GetDeviceInformation();
    }
}
