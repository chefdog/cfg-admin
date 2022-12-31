using cfg.pi.services;
using cfg.pi.web;
using Microsoft.AspNetCore.Mvc;

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
                var response = new ResponseModel<bool>
                {
                    Data = result,
                    DidError = false,
                    Error = string.Empty
                };

                return Ok(response);
            }
            catch(Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }
}
