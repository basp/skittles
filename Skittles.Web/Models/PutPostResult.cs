namespace Skittles.Web.Models
{
    using Newtonsoft.Json;

    public class PutPostResult
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("etag")]
        public string Etag { get; set; }
    }
}