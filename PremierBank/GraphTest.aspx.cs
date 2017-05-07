using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PremierBank
{
    public partial class GraphTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select distinct TxAmount from Trans";
                DataTable dt = GetData(query);
                
                ddlCountry1.DataSource = dt;
                ddlCountry1.DataTextField = "TxAmount";
                ddlCountry1.DataValueField = "TxAmount";
                ddlCountry1.DataBind();

                ddlCountry2.DataSource = dt;
                ddlCountry2.DataTextField = "TxAmount";
                ddlCountry2.DataValueField = "TxAmount";
                ddlCountry2.DataBind();
                ddlCountry2.Items[1].Selected = true;
            }
        }

        protected void Compare(object sender, EventArgs e)
        {
            string query = string.Format("select TxAmount from Trans", ddlCountry1.SelectedItem.Value);
            DataTable dt = GetData(query);

            string[] x = new string[dt.Rows.Count];
            decimal[] y = new decimal[dt.Rows.Count];
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    x[i] = dt.Rows[i][0].ToString();
            //    y[i] = Convert.ToInt32(dt.Rows[i][1]);
            //}
            LineChart1.Series.Add(new AjaxControlToolkit.LineChartSeries { Name = ddlCountry1.SelectedItem.Value, Data = y });

            query = string.Format("select TxAmount from Trans", ddlCountry2.SelectedItem.Value);
            dt = GetData(query);

            y = new decimal[dt.Rows.Count];
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    x[i] = dt.Rows[i][0].ToString();
            //    y[i] = Convert.ToInt32(dt.Rows[i][1]);
            //}
            LineChart1.Series.Add(new AjaxControlToolkit.LineChartSeries { Name = ddlCountry2.SelectedItem.Value, Data = y });
            LineChart1.CategoriesAxis = string.Join(",", x);

            LineChart1.ChartTitle = string.Format("{0} and {1} Order Distribution", ddlCountry1.SelectedItem.Value, ddlCountry2.SelectedItem.Value);
            LineChart1.Visible = true;
        }

        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["PremierBankCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }
    }
}