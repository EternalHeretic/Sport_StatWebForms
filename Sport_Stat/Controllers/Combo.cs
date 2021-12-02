using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Sport_Stat.Controllers
{
    public class Combo
    {
        public static string conStr = ConfigurationManager.AppSettings["DefaultConnection"];
        public static string NameDateBase = "aspnet-Sport_Stat-20180128084905";


        public static string getParentIdfromTable(string _tableName, string _fieldName, string _whereValue)
        {
            string[] fieldList = new string[] { _fieldName };
            DataTable dt = getDataFromTable(_tableName, fieldList, "", _whereValue);
            return dt.Rows[0][0].ToString();
        }



        //подгрузка данных из таблицы
        public static DataTable getDataFromTable(
             string _tableName
           , string[] _fieldList
           , string _joinValue = ""
           , string _whereValue = ""
           , string[] _orderByValue = null
           , string[] _groupByValue = null
           , Int32[] _rowsRange = null
           , string query = ""
           )
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[Combo.conStr].ConnectionString))
            {
                if (query == "")
                {
                    query = _rowsRange != null ? "select * from ( select " : "select ";
                    for (var i = 0; i < _fieldList.Length; i++)
                    {
                        if (i > 0)
                        {
                            query += ", ";
                        }
                        query += _fieldList[i].ToLower();
                    }

                    if (query.IndexOf("sum(") == -1 && query.IndexOf("count(") == -1 && query.IndexOf("max(") == -1 && query.IndexOf("min(") == -1)
                    {

                    }

                    query += " from [" + NameDateBase + "].[dbo].[" + _tableName + "]";

                    if (_joinValue.Trim() != "")
                    {
                        query += _joinValue;
                    }
                    if (_whereValue.Trim() != "")
                    {
                        query += " where " + _whereValue;
                    }

                    if (_groupByValue != null)
                    {
                        for (var i = 0; i < _groupByValue.Length; i++)
                        {
                            if (i > 0)
                            {
                                query += ", ";
                            }
                            else
                            {
                                query += " group by ";
                            }

                            query += _groupByValue[i].ToLower(); ;
                        }
                    }

                    if (_orderByValue != null)
                    {
                        for (var i = 0; i < _orderByValue.Length; i++)
                        {
                            if (i > 0)
                            {
                                query += ", ";
                            }
                            else
                            {
                                query += " order by ";
                            }

                            query += _orderByValue[i].ToLower(); ;
                        }
                    }

                    query += _rowsRange != null ? ") as PrimaryTable where RowNo >= " + _rowsRange[0].ToString() + " and RowNo <= " + _rowsRange[1].ToString() + " ;" : ";";
                }
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, con);

                DataSet dSet = new DataSet();

                sqlDa.Fill(dSet, _tableName);

                return dSet.Tables[_tableName];
            }
        }

        //добавление записи в таблицу
        public static void addNewRec(string _tableName, string[] _fieldList, string[] _valueList)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[Combo.conStr].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;

                var fieldList = "";
                for (var i = 0; i < _fieldList.Length; i++)
                {
                    if (i > 0)
                    {
                        fieldList += ", ";
                    }
                    fieldList += "[" + _fieldList[i] + "]";
                }

                var valueList = "";
                for (var i = 0; i < _valueList.Length; i++)
                {
                    if (i > 0)
                    {
                        valueList += ", ";
                    }
                    valueList += _valueList[i];
                }

                cmd.CommandText = " INSERT INTO [" + NameDateBase + "].[dbo].[" + _tableName + "] (" + fieldList + ") VALUES(" + valueList + ")";
                cmd.ExecuteNonQuery();
            }
        }

        //редактирование записи в таблице
        public static void editRec(string _tableName, string[] _fieldList, string[] _valueList, string _whereValue = "")
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[Combo.conStr].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;

                var setList = "";
                for (var i = 0; i < _fieldList.Length; i++)
                {
                    if (i > 0)
                    {
                        setList += ", ";
                    }
                    setList += "[" + _fieldList[i] + "]=" + _valueList[i];
                }

                cmd.CommandText = " UPDATE [" + NameDateBase + "].[dbo].[" + _tableName + "] SET " + setList + " where " + _whereValue;
                cmd.ExecuteNonQuery();
            }
        }

        //удаление записи с таблицы
        public static void delRec(string _tableName, string _whereValue = "")
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[Combo.conStr].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;

                cmd.CommandText = " DELETE FROM [" + NameDateBase + "].[dbo].[" + _tableName + "] where " + _whereValue;
                cmd.ExecuteNonQuery();
            }

        }
    }
}