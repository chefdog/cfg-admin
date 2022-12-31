using cfg.pi.datatransferobjects;
using cfg.pi.services;
using cfg.pi.web;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace cfg.pi.webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SystemInformationController : ControllerBase
    {
        private DeviceService deviceService;

        public SystemInformationController(DeviceService service)
        {
            deviceService = service;
        }


        [HttpGet]
        public async Task<IActionResult> GetHealthProbeAsync()
        {
            var result = await deviceService.GetDevices();
            var response = new ResponseModel<List<HealthDto>> {
                Data = result,
                DidError = false,
                Error = string.Empty
            };
            return Ok(response);
        }
    }
}
