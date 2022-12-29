using Iot.Device.SenseHat;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cfg.pi.services.HatServices
{
    public class HatServiceImpl : HatService
    {
        

        public HatServiceImpl() { }


        public bool ExecuteLedMatrix()
        {
            using (var sh = new SenseHat())
            {
                sh.SetPixel(0, 0, Color.Yellow);
                return true;
            }
        }

        public bool ResetLedMatrix()
        {
            throw new NotImplementedException();
        }
    }
}
