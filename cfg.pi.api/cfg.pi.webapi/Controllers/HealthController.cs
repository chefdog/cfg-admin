using cfg.pi.web;
using Microsoft.AspNetCore.Mvc;

namespace cfg.pi.webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthController : BaseController
    {
        [HttpGet]
        public IActionResult Get()
        {
            var response = new ResponseModel<string>
            {
                Data = "Ping Back",
                DidError = false,
                Error = string.Empty
            };

            return Ok(response);
        }


    }
}
