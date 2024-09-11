using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupplierMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int saveSupplier(Supplier objsupplier)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return SupplierMasterDAL.SaveSupplierMaster(objsupplier);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in SupplierMaster_saveSupplier(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Supplier getSupplierMEdit(int SID)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return SupplierMasterDAL.GetSupplietMasterforEdit(SID);
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in SupplierMaster_GetSupplietMasterforEdit(): " + ex.Message);
            throw (ex);
        }
    }
}