using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerMasters : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static CusMaster[] getCusMasdropdown()
    {
        try
        {

            return CustomerMasterDAL.GetCusMasdropdown();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerMaster_GetCusMasdropdown(): " + ex.Message);
            throw (ex);
        }
    }



    [WebMethod]
    public static int saveCustomerMaster(CustomerMaster objCustomer)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return CustomerMasterDAL.SaveCustomerMaster(objCustomer);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerMaster_SaveCustomerMaster(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static CustomerMaster getCustomerMEdit(int CID)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return CustomerMasterDAL.GetcusMasterforEdit(CID);
        }


        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerMaster_GetcusMasterforEdit(): " + ex.Message);
            throw (ex);
        }
    }
}