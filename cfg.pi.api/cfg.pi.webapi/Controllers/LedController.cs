using cfg.pi.services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace cfg.pi.webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LedController : ControllerBase
    {
        private readonly HatService service;

        public LedController(HatService hatService) {
            service = hatService;
        }

        [HttpGet]
        public IActionResult GetLedAction()
        {
            try
            {
                var result = service.ExecuteLedMatrix();
                return Ok(result);
            }catch(Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }
}
