<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageSeries.aspx.cs" Inherits="Series_Management_System.PL.ManageSeries" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Manage Series</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Manage Series</h2>

        <div>
            <label for="txtSeriesAPIID">Series API ID</label>
            <asp:TextBox ID="txtSeriesAPIID" runat="server"></asp:TextBox>
        </div>

        <div>
            <label for="txtSeriesName">Series Name</label>
            <asp:TextBox ID="txtSeriesName" runat="server"></asp:TextBox>
        </div>

        <div>
            <label for="ddlSeriesType">Series Type</label>
            <asp:DropDownList ID="ddlSeriesType" runat="server">
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="International" Value="International" />
                <asp:ListItem Text="Domestic" Value="Domestic" />
                <asp:ListItem Text="Women" Value="Women" />
                <asp:ListItem Text="Men" Value="Men" />
            </asp:DropDownList>
        </div>

        <div>
            <label for="txtStartDate">Start Date From</label>
            <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="calStartDate" runat="server" TargetControlID="txtStartDate" Format="yyyy-MM-dd" />
        </div>

        <div>
            <label for="txtEndDate">End Date To</label>
            <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="calEndDate" runat="server" TargetControlID="txtEndDate" Format="yyyy-MM-dd" />
        </div>

       <div>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    <asp:Button ID="btnAddSeries" runat="server" Text="Add New Series" OnClick="btnAddSeries_Click" />
</div>

        <div>
            <table id="seriesTable" border="1">
                <thead>
                    <tr>
                        <th>Series API ID</th>
                        <th>Series Name</th>
                        <th>Series Type</th>
                        <th>Series Status</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </form>

    <script>
        $(document).ready(function() {
            $("#btnSearch").click(function(e) {
                e.preventDefault();
                $.ajax({
                    url: "SearchSeriesService.aspx",
                    type: "GET",
                    data: {
                        seriesAPIID: $("#txtSeriesAPIID").val(),
                        seriesName: $("#txtSeriesName").val(),
                        seriesType: $("#ddlSeriesType").val(),
                        startDate: $("#txtStartDate").val(),
                        endDate: $("#txtEndDate").val()
                    },
                    success: function (response) {
                        var rows = "";
                        response.forEach(function(series) {
                            rows += "<tr>";
                            rows += "<td>" + series.SeriesAPIID + "</td>";
                            rows += "<td><a href='AddSeries.aspx?seriesID=" + series.SeriesID + "'>" + series.SeriesName + "</a></td>";
                            rows += "<td>" + series.SeriesType + "</td>";
                            rows += "<td>" + series.SeriesStatus + "</td>";
                            rows += "<td>" + series.SeriesStartDate + "</td>";
                            rows += "<td>" + series.SeriesEndDate + "</td>";
                            rows += "<td><button onclick='deleteSeries(" + series.SeriesID + ")'>Delete</button></td>";
                            rows += "</tr>";
                        });
                        $("#seriesTable tbody").html(rows);
                    },
                    error: function() {
                        alert("Error loading series data.");
                    }
                });
            });
        });
    </script>
</body>
</html>

