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
        private readonly IWebHostEnvironment hostEnvironment;

        public HealthController(DeviceService service, IWebHostEnvironment environment) { 
            deviceService = service;
            hostEnvironment = environment;
        }


        [HttpGet]
        public async Task<IActionResult> GetHealthProbeAsync() {
            var result = await deviceService.GetDeviceInformation();
            result.Environment = hostEnvironment.EnvironmentName;
            return Ok(result);
        }

        
    }
}
