using cfg.pi.datatransferobjects;
using cfg.pi.services;
using cfg.pi.web;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace cfg.pi.webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SystemInformationController : BaseController
    {
        private DeviceService deviceService;

        public SystemInformationController(ILogger<SystemInformationController> controllerLogger, DeviceService service)
        {
            deviceService = service;
            logger = controllerLogger;
        }


        [HttpGet]
        public async Task<IActionResult> GetHealthProbeAsync()
        {
            return await ToApiResponse(() => deviceService.GetDevices());
        }
    }
}
