using EnglishNow.Web.Models.Erro;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace EnglishNow.Web.Controllers {
    public class ErroController : Controller {
        public IActionResult Index() {

            var execptionHandlerFeature = HttpContext.Features.Get<IExceptionHandlerFeature>();
            var model = new ErroViewModel {
                MensagemErro = execptionHandlerFeature == null ? "Erro inesperado" : execptionHandlerFeature.Error.Message
            };

            return View(model);
        }
    }
}
