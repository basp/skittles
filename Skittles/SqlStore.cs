﻿namespace Skittles
{
    using Dapper;
    using Newtonsoft.Json;
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using System.Xml;

    public class SqlStore
    {
        const string connStr =
            @"Data Source=FOO\SQLEXPRESS;Integrated Security=SSPI;Initial Catalog=sandbox";

        public Document Create(string id, dynamic data)
        {
            var @param = new 
            {
                id,
                etag = Guid.NewGuid().ToString(),
                data = Serialize(data)
            };

            using(var conn = new SqlConnection(connStr))
            {
                conn.Execute(
                    "skittles.create_document",
                    @param,
                    commandType: CommandType.StoredProcedure);

                return new Document
                {
                    Id = id,
                    Etag = @param.etag,
                    Data = data
                };
            }
        }

        public Document Create(dynamic data)
        {
            var id = Guid.NewGuid().ToString();
            return Create(id, data);
        }

        public Document Get(string id)
        {
            using(var conn = new SqlConnection(connStr))
            {
                var @param = new { id };
                var r = conn
                    .Query<dynamic>("select top 1 * from skittles.get_document(@id)", @param)
                    .FirstOrDefault();

                return new Document
                {
                    Id = r.id,
                    Etag = r.etag,
                    Data = Deserialize(r.data)
                };
            }
        }

        private static string Serialize(dynamic data)
        {
            var json = JsonConvert.SerializeObject(data);
            var doc = (XmlDocument)JsonConvert.DeserializeXmlNode(json, "doc");
            return doc.OuterXml;
        }

        private dynamic Deserialize(string xml)
        {
            var doc = new XmlDocument();
            doc.LoadXml(xml);
            var json = JsonConvert.SerializeXmlNode(doc);
            return JsonConvert.DeserializeObject<dynamic>(json);
        }
    }
}
