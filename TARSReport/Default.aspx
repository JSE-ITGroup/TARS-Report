<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TARSReport._Default" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <p class="lead">TARS Reports</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DES" DataValueField="Location">
                </asp:DropDownList>
            </h2>
            <p>
                &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebFeedRepositoryConnectionString %>" SelectCommand="SELECT ID, LTRIM(RTRIM(LOC)) + LTRIM(RTRIM(FIL)) AS Location, DES FROM REPORT WHERE VISIBLE='Y'"></asp:SqlDataSource>
            </p>
        </div>
        <div class="col-md-4">
            <h2>
                <asp:Button ID="GenerateReport" runat="server" OnClick="GenerateReport_Click" Text="ViewReport" />
            </h2>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" EnableDatabaseLogonPrompt="False" />
            <p>
            </p>
        </div>
    </div>

</asp:Content>
