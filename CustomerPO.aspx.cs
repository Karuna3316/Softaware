using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerPO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static DrpCustomerName[] BindDrpCustomerName()
    {
        try
        {
            return CustomerPODAL.GetCustomerName();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerPO_GetCustomerName(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static int SaveOrUpdateCustomerPO(CustomerPOLst objCustomerPO)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return CustomerPODAL.SaveOrUpdateCustomerPO(objCustomerPO);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerPO_SaveOrUpdateCustomerPO(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static CustomerPOLst BindCustomerPOforEdit(int CustomerPOID)
    {
        try
        {

            return CustomerPODAL.GetCustomerPOforEdit(CustomerPOID);
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in  CustomerPO_GetCustomerPOforEdit(): " + ex.Message);
            throw (ex);
        }
    }
}