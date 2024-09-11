using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Stock : System.Web.UI.Page
{
    static string conS = System.Configuration.ConfigurationManager.AppSettings["dbConStr"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static stocksobj GetstockList()
    {
        try
        {
            stocksobj lstOutWL = new stocksobj();
            using (SqlConnection con = new SqlConnection(conS))
            {
                using (SqlCommand cmd = new SqlCommand("GetStock", con))
                {

                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dtObj = new DataTable();
                    da.Fill(dtObj);
                    if (dtObj != null && dtObj.Rows.Count > 0)
                    {
                        foreach (DataRow drPC in dtObj.Rows)
                        {

                            stocks obout = new stocks();
                            obout.ProductsId = Convert.ToInt32(drPC["ProductId"].ToString());
                            obout.test = drPC["Quantity"].ToString();
                            obout.productname = drPC["ProductName"].ToString();
                            obout.HsnNo = drPC["HSN"].ToString();
                            obout.LPrice = drPC["LPrice"].ToString();
                            obout.Description = drPC["Description"].ToString();

                            lstOutWL.lststocksObj.Add(obout);
                        }
                    }
                }
            }


            return lstOutWL;
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Stock_GetstockList(): " + ex.Message);
            throw(ex);
        }

    }

}