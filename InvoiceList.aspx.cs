using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InvoiceList : System.Web.UI.Page
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

                    //userIdHiddenField.Value = userId.ToString();
                    userIdHiddenField.Value = roleId.ToString();


                }
            }
        }
    }
    [WebMethod]
    public static Invoiceobj getinvoice()
    {
        try
        {
            Invoiceobj objLstLR = InvoiceDAL.Getinvoice();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in InvoiceList_Getinvoice(): " + ex.Message);
            throw (ex);
        }

    }
    [WebMethod]
    public static int deleteInvoice(int lReqId)
    {
        try
        {
            int affectedRows = 0;

            affectedRows = InvoiceDAL.Deleteinvoice(lReqId);
            return affectedRows;
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in InvoiceList_Deleteinvoice(): " + ex.Message);
            throw (ex);
        }
    }

}