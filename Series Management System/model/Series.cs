using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Series_Management_System.DAL
{
    public class Series
    {
        public int SeriesID { get; set; }
        public object SeriesId { get; internal set; }
        public int SeriesAPIID { get; internal set; }
        public object SeriesAPIId { get; internal set; }
        public string SeriesName { get; set; }
        public string SeriesType { get; set; }
        public string SeriesStatus { get; set; }
        public string MatchStatus { get; set; }
        public string MatchFormat { get; set; }
        public string SeriesMatchType { get; set; }
        public string Gender { get; set; }
        public int Year { get; set; }
        public string TrophyType { get; set; }
        public DateTime SeriesStartDate { get; set; }
        public DateTime SeriesEndDate { get; set; }
        public bool IsActive { get; set; }
        public string Description { get; set; }
        public object SeriesDALName { get; internal set; }
    }
}