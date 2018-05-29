using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Linq;
using System.Web.UI;

namespace TARSReport
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportViewer1.ReportSource = (ReportDocument)Session["myReport"];
        }

        protected void GenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                ReportDocument reports = new ReportDocument();
                reports.Load(DropDownList1.SelectedValue.ToString());
                if (DropDownList1.SelectedValue.ToString().Contains("CESS") || DropDownList1.SelectedValue.ToString().Contains("CA") || DropDownList1.SelectedValue.ToString().Contains("Dividend"))
                {
                    reports.SetDatabaseLogon(Properties.Settings.Default.UserName, Properties.Settings.Default.Password, Properties.Settings.Default.Server, Properties.Settings.Default.DatabaseWebFeedRepository);
                }
                else
                {
                    reports.SetDatabaseLogon(Properties.Settings.Default.UserName, Properties.Settings.Default.Password, Properties.Settings.Default.Server, Properties.Settings.Default.DatabaseWebRepository);
                }
                CrystalReportViewer1.Visible = true;
                CrystalReportViewer1.ReportSource = reports;
                Session["myReport"] = reports;
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }
    }
}