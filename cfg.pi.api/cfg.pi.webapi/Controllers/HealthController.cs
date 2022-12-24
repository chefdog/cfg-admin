using cfg.pi.datatransferobjects;
using cfg.pi.services;
using cfg.pi.web;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace cfg.pi.webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthController : BaseController
    {
        private DeviceService deviceService;

        public HealthController(DeviceService service) { 
            deviceService = service;
        }


        [HttpGet]
        public async Task<IActionResult> GetHealthProbeAsync() {
            return await ToApiResponse<HealthDto>(deviceService.GetDeviceInformation());
        }
    }
}
