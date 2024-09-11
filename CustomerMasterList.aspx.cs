using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerMasterList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    public static CustomerMobj getcustomermaster()
    {
        try
        {
            CustomerMobj objLstLR = CustomerMasterDAL.GetCustomerMaster();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in  CustomerMasterList_GetCustomerMaster(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static int deleteCusMaster(int lReqId)
    {
        try
        {
            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = CustomerMasterDAL.deleteCustomerMaster(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerMasterList_deleteCustomerMaster(): " + ex.Message);
            throw (ex);
        }
       
    }
}