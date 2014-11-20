namespace Skittles.Web.Controllers
{
    using Skittles.Web.Models;
    using System;
    using System.Net;
    using System.Net.Http;
    using System.Net.Http.Formatting;
    using System.Web.Http;

    public class DocumentController : ApiController
    {
        readonly SqlStore store = new SqlStore();

        [HttpGet]
        [Route("api/docs/{id}")]
        public HttpResponseMessage Get([FromUri] string id)
        {
            var doc = (Document)this.store.Get(id);
            var formatter = new JsonMediaTypeFormatter();
            var content = new ObjectContent<dynamic>(doc.Data, formatter);
            return new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = content
            };
        }

        [HttpPut]
        [Route("api/docs/{id}")]
        public HttpResponseMessage Put([FromUri] string id, [FromBody] dynamic data)
        {
            var doc = (Document)this.store.Create(id, data);
            var result = new PutPostResult
            {
                Id = doc.Id,
                Etag = doc.Etag
            };

            var formatter = new JsonMediaTypeFormatter();
            var content = new ObjectContent<PutPostResult>(result, formatter);
            return new HttpResponseMessage(HttpStatusCode.Created)
            {
                Content = content
            };
        }

        [HttpPost]
        [Route("api/docs")]
        public HttpResponseMessage Post([FromBody] dynamic data)
        {
            var doc = (Document)this.store.Create(data);
            var result = new PutPostResult
            {
                Id = doc.Id,
                Etag = doc.Etag
            };

            var formatter = new JsonMediaTypeFormatter();
            var content = new ObjectContent<PutPostResult>(result, formatter);
            return new HttpResponseMessage(HttpStatusCode.Created)
            {
                Content = content
            };
        }

        [HttpDelete]
        [Route("api/docs/{id}")]
        public HttpResponseMessage Delete([FromBody] string id)
        {
            return new HttpResponseMessage(HttpStatusCode.NoContent);
        }
    }
}
