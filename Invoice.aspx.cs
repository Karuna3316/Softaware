using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Invoice : System.Web.UI.Page
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
    public static ponumber[] getpoNumber(int SupplierId)
    {
        try
        {
            return InvoiceDAL.GetpoNumber(SupplierId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_GetpoNumber(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static DrpDCNo[] GetDCNumberDrp(int OutwardTypeId)
    {
        try
        {
            return InvoiceDAL.GetDCNumberDrp(OutwardTypeId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_GetDCNumberDrp(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static product[] getproduct(int OutwardId)
    {
        try
        {
            return InvoiceDAL.getproductname(OutwardId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_getproductname(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static product[] getproductnameEdit(int OutwardId)
    {
        try
        {
            return InvoiceDAL.getproductnameEdit(OutwardId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_getproductname(): " + ex.Message);
            throw (ex);
        }
    } 
    
    [WebMethod]
    public static ProjectIdDrp[] GetProjectId()
    {
        try
        {
            return InvoiceDAL.GetProjectIdDrp();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_GetProjectId(): " + ex.Message);
            throw (ex);
        }
    }
     [WebMethod]
    public static CustomerPODrp[] GetCustomerPO()
    {
        try
        {
            return InvoiceDAL.GetCustomerPODrp();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_GetProjectId(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static invoice getprice(int ProductsID)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return InvoiceDAL.getproductprice( ProductsID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_getproductprice(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static invoice BindStockAvailability(int ProductsID)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return InvoiceDAL.GetStockAvailability(ProductsID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_getproductprice(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static invoice BindPrevOutwardQty(int ProductsID)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return InvoiceDAL.GetPrevOutwardQty(ProductsID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_BindPrevOutwardQty(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Supplierdropdown[] BindSupplier()
    {
        try
        {
            return InvoiceDAL.GetSupplier();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_Suppliers(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static int SaveOrUpdateinvoice(invoice inObj)
    {
        try
        {

            return InvoiceDAL.SaveOrUpdateInvoice(inObj);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_SaveOrUpdateinvoice(): " + ex.Message);
            throw (ex);
        }

    }


    [WebMethod]
    public static invoice BindEditInvoice(int InvoiceId)
    {
        try
        {

            return InvoiceDAL.GetInvoiceEdit(InvoiceId);
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Invoice_BindEditInvoice(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static invoice Bindinvoicenumber()
    {
        invoice objAT = new invoice();
        Hashtable objHT = new Hashtable();

        DataTable dtObj = InvoiceDAL.GetResultAsTable("Bindinvoicenumber", objHT);
        if (dtObj != null && dtObj.Rows.Count > 0)
        {

            if (dtObj.Rows[0]["InvoiceNo"] != null && dtObj.Rows[0]["InvoiceNo"].ToString() != "")
                objAT.InvoiceNo = dtObj.Rows[0]["InvoiceNo"].ToString();
        }
        return objAT;

    }
    
}