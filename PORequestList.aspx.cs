using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PORequestList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Session["objUser"] != null)
            {
                User oU = HttpContext.Current.Session["objUser"] as User;

                if (oU != null)
                {
                    int userId = oU.userId;
                    int roleId = oU.roleId;

                    userIdHiddenField.Value = roleId.ToString();

                   
                }
            }
        }
    }

    [WebMethod]
    public static lstSuppliers_FDSS GetSupplierList(int SupplierId)
    {
        try
        {
            lstSuppliers_FDSS objLstLR = PORequestDAL.GetSupplierList(SupplierId);
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequestList_GetProductMasterList(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static int DeleteSupplier(int SuppID)
    {
        try
        {
            int affectedRows = 0;
            affectedRows = PORequestDAL.DeleteSupplier(SuppID);
            return affectedRows;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequestList_DeleteSupplier(): " + ex.Message);
            throw (ex);
        }

    }
}