using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace cfg.pi.web
{
    public class ResponseModel<TModel>
    {
        public TModel Data { get; set; }

        public bool DidError { get; set; }

        public string Error { get; set; }
    }
}