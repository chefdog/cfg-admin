using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace cfg.pi.webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PingController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get() {
            return Ok("Ping Back");
        }
    }
}
