
using Series_Management_System.DAL;
using System;
using System.Data;

namespace SeriesBAL
{
    public class SeriesBAL
    {
        private SeriesDAL dal = new SeriesDAL();

        public void InsertSeries(Series series)
        {
            try
            {
                dal.InsertSeries(series);
            }
            catch (Exception )
            {
               
                throw;
            }
        }

        public void UpdateSeries(Series series)
        {
            try
            {
                dal.UpdateSeries(series);
            }
            catch (Exception )
            {
               
                throw;
            }
        }

        public DataTable SearchSeries(Series series)
        {
            try
            {
                return dal.
                    SearchSeries(series);
            }
            catch (Exception )
            {
                throw;
            }
        }
    }
}