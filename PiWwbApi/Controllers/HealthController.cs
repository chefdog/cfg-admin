using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PiWwbApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthController : ControllerBase
    {
        private readonly IWebHostEnvironment hostEnvironment;
        public HealthController(IWebHostEnvironment env) {
            hostEnvironment = env;
        }

        [HttpGet]
        public IActionResult Get() {
            return Ok($"{hostEnvironment.EnvironmentName}");
        }
    }
}
