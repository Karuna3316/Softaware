using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerPOList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static CustomerPOListobj BindCutomerPoList()
    {
        try
        {
            CustomerPOListobj objLstLR = CustomerPODAL.GetCutomerPoList();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerPOList_GetCutomerPoList(): " + ex.Message);
            throw (ex);
        }

    }

    [WebMethod]
    public static int DeleteCustomerPO(int lReqId)
    {
        try
        {
            int affectedRows = 0;

            affectedRows = CustomerPODAL.DeleteCustomerPO(lReqId);
            return affectedRows;
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in CustomerPOList_DeleteCustomerPO(): " + ex.Message);
            throw (ex);
        }
    }
}
