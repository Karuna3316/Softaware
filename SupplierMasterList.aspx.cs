using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class SupplierMasterList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static supplierobj getsuppliermaster()
    {
        try
        {
            supplierobj objLstLR = SupplierMasterDAL.GetSupplierMaster();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in SupplierMasterList_getsuppliermaster(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static int deleteSupplierMaster(int lReqId)
    {
        try
        {
            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = SupplierMasterDAL.DeleteSupplierMaster(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in SupplierMasterList_deleteSupplierMaster(): " + ex.Message);
            throw (ex);
        }
    }
}