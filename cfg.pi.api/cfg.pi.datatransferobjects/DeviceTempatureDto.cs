using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cfg.pi.datatransferobjects
{
    public class DeviceTempatureDto
    {
        public string SensorName { get; set; }
        public double Tempature { get; set; }

        public bool TempatureInCelcius { get; set; }
    }
}
