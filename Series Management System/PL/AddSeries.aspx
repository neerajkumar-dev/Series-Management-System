
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSeries.aspx.cs" Inherits="Series_Management_System.PL.AddSeries" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add or Update Series</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <h2><asp:Label ID="lblTitle" runat="server" Text="Add New Series"></asp:Label></h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div>
            <label for="txtSeriesName">Series Name</label>
            <asp:TextBox ID="txtSeriesName" runat="server" MaxLength="250"></asp:TextBox>
<%--            <asp:RequiredFieldValidator ID="rfvSeriesName" ControlToValidate="txtSeriesName" runat="server" ErrorMessage="Series Name is required" ForeColor="Red" />--%>
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
<%--            <asp:RequiredFieldValidator ID="rfvSeriesType" ControlToValidate="ddlSeriesType" InitialValue="" runat="server" ErrorMessage="Series Type is required" ForeColor="Red" />--%>
        </div>

        <div>
            <label for="ddlSeriesStatus">Series Status</label>
            <asp:DropDownList ID="ddlSeriesStatus" runat="server">
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="Scheduled" Value="Scheduled" />
                <asp:ListItem Text="Completed" Value="Completed" />
                <asp:ListItem Text="Live" Value="Live" />
                <asp:ListItem Text="Abandoned" Value="Abandoned" />
            </asp:DropDownList>
        </div>

        <div>
            <label for="ddlMatchFormat">Match Format</label>
            <asp:DropDownList ID="ddlMatchFormat" runat="server">
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="ODI" Value="ODI" />
                <asp:ListItem Text="Test" Value="Test" />
                <asp:ListItem Text="T20" Value="T20" />
                <asp:ListItem Text="T10" Value="T10" />
            </asp:DropDownList>
        </div>

        <div>
            <label for="ddlGender">Gender</label>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="Men" Value="Men" />
                <asp:ListItem Text="Women" Value="Women" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList>
        </div>

        <div>
            <label for="txtYear">Year</label>
            <asp:TextBox ID="txtYear" runat="server" MaxLength="4"></asp:TextBox>
<%--            <asp:RequiredFieldValidator ID="rfvYear" ControlToValidate="txtYear" runat="server" ErrorMessage="Year is required" ForeColor="Red" />--%>
        </div>

        <div>
            <label for="txtSeriesStartDate">Series Start Date</label>
            <asp:TextBox ID="txtSeriesStartDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="calSeriesStartDate" runat="server" TargetControlID="txtSeriesStartDate" Format="yyyy-MM-dd" />
        </div>

        <div>
            <label for="txtSeriesEndDate">Series End Date</label>
            <asp:TextBox ID="txtSeriesEndDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="calSeriesEndDate" runat="server" TargetControlID="txtSeriesEndDate" Format="yyyy-MM-dd" />
        </div>

        <div>
            <label for="ddlIsActive">Is Active</label>
            <asp:DropDownList ID="ddlIsActive" runat="server">
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="Yes" Value="1" />
                <asp:ListItem Text="No" Value="0" />
            </asp:DropDownList>
        </div>

        <div>
            <label for="txtDescription">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" MaxLength="500"></asp:TextBox>
        </div>

        <div>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />

            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </div>

    </form>
</body>
</html>

<script>
    $(document).ready(function () {
        $("#btnSubmit").click(function () {
            InsertUpdateData();
            return false;
        })
    })

    function InsertUpdateData() {
        try {
            $.post("http://localhost:53037/PL/AddSeries.aspx/InsertUpdateData", {
                SeriesName: $("#txtSeriesName").val(),
                SeriesType: $("#ddlSeriesType").val(),
                SeriesStatus: $("#ddlSeriesStatus").val(),
                MatchFormat: $("#ddlMatchFormat").val(),
                Gender: $("#ddlGender").val(),
                Year: $("#txtYear").val(),
                SeriesStartDate: $("#txtSeriesStartDate").val(),
                SeriesEndDate: $("#txtSeriesEndDate").val(),
                IsActive: $("#ddlIsActive").val(),
                Description: $("#txtDescription").val()
            }, function (response) {
                alert(response);
            });
           

        } catch (e) {
            alert("Error in InsertUpdateData : "+e.message);
        }
    }
</script>
