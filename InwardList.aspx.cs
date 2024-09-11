using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InwardList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static InwardObj getinwardlist()
    {
        try
        {
            InwardObj objLstLR = InwardDAL.GetInwardlist();  
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in InwardList_GetInwardlist(): " + ex.Message);
            throw (ex);
        }

    }

    [WebMethod]
    public static int deleteinward(int lReqId)
    {
        try
        {
            int affectedRows = 0;

            affectedRows = InwardDAL.Deleteinward(lReqId);
            return affectedRows;
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in InwardList_Deleteinward(): " + ex.Message);
            throw (ex);
        }
    }
}