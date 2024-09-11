using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMasterList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static lstProductMasters GetProductMasterList()
    {
        try
        {
            lstProductMasters objLstLR = ProductMasterDAL.GetProductMasterList();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProductMasterList_GetProductMasterList(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static int DeleteProductsMaster (int ProductsID)
    {
        try
        {
            int affectedRows = 0;
            affectedRows = ProductMasterDAL.DeleteProductsMaster(ProductsID);
            return affectedRows;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProductMasterList_DeleteProductsMaster(): " + ex.Message);
            throw (ex);
        }

    }
}