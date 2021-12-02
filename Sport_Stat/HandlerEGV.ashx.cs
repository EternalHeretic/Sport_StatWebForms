using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Sport_Stat.Models;
using System.Data.Entity;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Collections;
using Sport_Stat.Controllers;

namespace Sport_Stat
{

    public class DataInOut
    {
        public string Id { get; set; }
        public string tst { get; set; }
        public string User { get; set; }
    }
    public class HandlerEGV : IHttpHandler
    {
        public static string tableName1 = "AspNetUsers";
        public static string[] fieldlist1 = new string[] {
                "Email",
                "EmailConfirmed",
                "PasswordHash",
                "SecurityStamp",
                "PhoneNumber",
                "PhoneNumberConfirmed",
                "TwoFactorEnabled",
                "LockoutEndDateUtc",
                "LockoutEnabled",
                "AccessFailedCount",
                "UserName",
                "PeopleId"
            };


        private DataInOut GetData(string Id, string tst, string User) //Id -здесь это некоторый условный параметр, по которому определяем характер ответа. В текущем случае, конечно никакой фактической обработки не производится, а произвольно придуманные строки сразу отправляются как ответ на страницу клиента
        {
            var datainout = new DataInOut();
            datainout.Id = Id; //Принятая от DOM элемента информация через $.ajax({...});
            datainout.tst = tst; //Некоторые действия с принятыми данными и формирование ответных полей данных
            datainout.User = User;

            string tableName = "Results";
            string[] fieldlist = new string[] {
                "ParticipantId",
                "RefereeId",
                "rating",
            };

            string refereeid = User;

            string[] valuelist = new string[] {
                "'" + Id + "'",
                "'" + refereeid + "'",
                "'" + tst + "'",
            };

            Controllers.Combo.addNewRec(tableName, fieldlist, valuelist);
           



            return datainout;
        }
        public void ProcessRequest(HttpContext context)
        {
            System.IO.StreamReader reader = new System.IO.StreamReader(context.Request.InputStream);
            string requestFromPost = reader.ReadToEnd();
            //Сейчас requestFromPost = "Id=10009&tst=ttss&empty="
            //Пускай осуществляется обмен только текстовыми данными
            //Создаём HashTable, где ключ = json пришедший ключ, data = json пришедшие данные. Если ключи дублируются, то такая пара игнорируется
            char[] c1 = new char[] { '&' }; char[] c2 = new char[] { '=' };
            Hashtable ht = new Hashtable(); string[] buf = null;
            string[] parms = requestFromPost.Split(c1, StringSplitOptions.RemoveEmptyEntries);
            foreach (string s in parms)
            {
                buf = s.Split(c2); if (buf.Length < 2) { continue; }
                if (!ht.ContainsKey(buf[0])) ht.Add(buf[0], buf[1]); //На всякий, значения с повторяющимися ключами пропускаем. Проверял, пары, с повторяющимися ключами через POST не передаются:
                                                                     //.js файл $.ajax({}); запрос: data: { 'Id': '10009', 'tst': 'ttss', 'empty': '', 'tst': 'ttss', 'tst2': 'ttss' }, //Данные, передаваемые на серверную сторону
                                                                     //На сервере приняли: "Id=10009&tst=ttss&empty=&tst2=ttss" Т.е. повторная пару 'tst': 'ttss' была где-то отфильтрованна
            }
            //GetData -функция, в которой обрабатывается принятый запрос и формируется ответное сообщение, для отправки на страницу
            DataInOut dio = GetData(Convert.ToString((ht["Id"]).ToString()), Convert.ToString(ht["tst"]).ToString(), Convert.ToString(ht["User"]).ToString()); //Обрабатываем принятые данные и формируем ответное сообщение            
            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            string serdio = javaScriptSerializer.Serialize(dio);
            context.Response.ContentType = "text/html";
            context.Response.Write(serdio);
            //serdio так выглядит ответное сообщение от сервера, передаваемое обратно на страницу, сделавшую запрос
            //{"Id":10009,"Data1":"Dat aa","Data2":"Dat bb"}
        }
        //если IsReusable = true, то объект хенделра будет повторно использоваться при последующих запросах. Заново, при каждом запросе создаваться не будет.
        public bool IsReusable { get { return true; } } //MSDN: Возвращает значение, позволяющее определить, может ли другой запрос использовать экземпляр класса
    }


}