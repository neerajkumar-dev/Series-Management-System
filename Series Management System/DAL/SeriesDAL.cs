using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Series_Management_System.DAL;

public class SeriesDAL
{
    private string connectionString = ConfigurationManager.ConnectionStrings["Neeraj"].ConnectionString;

    public void InsertSeries(Series series)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("prcTblSeriesInsert", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@SeriesAPIId", series.SeriesAPIId);
            command.Parameters.AddWithValue("@SeriesName", series.SeriesDALName);
            command.Parameters.AddWithValue("@SeriesType", series.SeriesType);
            command.Parameters.AddWithValue("@SeriesStartDate", series.SeriesStartDate);
            command.Parameters.AddWithValue("@SeriesEndDate", series.SeriesEndDate);
            command.ExecuteNonQuery();
        }
    }

    public void UpdateSeries(Series series)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("prcTblSeriesUpdate", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@SeriesId", series.SeriesId);
            command.Parameters.AddWithValue("@SeriesAPIId", series.SeriesAPIId);
            command.Parameters.AddWithValue("@SeriesName", series.SeriesName);
            command.Parameters.AddWithValue("@SeriesType", series.SeriesType);
            command.Parameters.AddWithValue("@SeriesStartDate", series.SeriesStartDate);
            command.Parameters.AddWithValue("@SeriesEndDate", series.SeriesEndDate);
            command.ExecuteNonQuery();
        }
    }

    public DataTable SearchSeries(int seriesID, Series series, object value)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("prcTblSeriesSearch", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@SeriesAPIId", series.SeriesAPIId);
            command.Parameters.AddWithValue("@SeriesType", series.SeriesType);
            command.Parameters.AddWithValue("@SeriesName", series.SeriesName);
            command.Parameters.AddWithValue("@SeriesStartDate", series.SeriesStartDate);
            command.Parameters.AddWithValue("@SeriesEndDate", series.SeriesEndDate);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            return dataTable;
        }
    }

    internal DataTable SearchSeries(Series series)
    {
        throw new NotImplementedException();
    }
}