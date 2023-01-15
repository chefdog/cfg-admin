using cfg.pi.exceptions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace cfg.pi.web
{
    public class BaseController : ControllerBase
    {
        protected ILogger logger;


        protected async Task<IActionResult> ToApiResponse<T>(Func<Task<T>> methodName, bool handleFile = false)
        {
            var apiResponse = new ResponseModel<T>();
            apiResponse.DidError = false;
            try
            {
                var result = await methodName();
                apiResponse.Data = result;
            }
            catch (BusinessException bex)
            {
                apiResponse.DidError = true;
                logger.LogInformation(bex.Message, bex);
            }
            catch (Exception ex)
            {
                logger.LogCritical(ex.Message, ex);
#if DEBUG
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
#else
                 no information exposure

                return StatusCode(StatusCodes.Status500InternalServerError);
#endif
            }

            return Ok(apiResponse);
        }
    }
}