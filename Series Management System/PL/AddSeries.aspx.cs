using Series_Management_System.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Series_Management_System.PL
{
    public partial class AddSeries : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["Neeraj"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
           
        }
        [WebMethod]
        public string InsertUpdateData(string SeriesName, string SeriesType, string SeriesStatus, string MatchFormat, string Gender
        , string Year, string SeriesStartDate, string SeriesEndDate, string IsActive, string Description)
        {
            string Msg = "";
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("prcTblSeriesInsert", connection);
                command.CommandType = CommandType.StoredProcedure;
               /* command.Parameters.AddWithValue("@SeriesAPIId", series.SeriesAPIId);
                command.Parameters.AddWithValue("@SeriesName", series.SeriesDALName);
                command.Parameters.AddWithValue("@SeriesType", series.SeriesType);
                command.Parameters.AddWithValue("@SeriesStartDate", series.SeriesStartDate);
                command.Parameters.AddWithValue("@SeriesEndDate", series.SeriesEndDate);*/
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count>0)
                {
                    
                }
            }
            return Msg;
        }

    }
}