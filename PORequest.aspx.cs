using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PORequest : System.Web.UI.Page
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
    public static DrpSupplier[] BindSupplier()
    {
        try
        {
            return PORequestDAL.GetSupplier();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequest_BindSupplier(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Drpproject[] GetProject()
    {
        try
        {
            return PORequestDAL.GetProject();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequest_GetProject(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static DrpProduct[] GetProduct(int SupplierId)
    {
        try
        {
            return PORequestDAL.GetProductname(SupplierId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequest_GetProduct(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Supplier_FDSS Getlastprice(int ProductsId)
    {
        try
        {
            return PORequestDAL.Getlastprice(ProductsId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequest_Getlastprice(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static Supplier_FDSS GetPrice(int SupplierId, int ProductsID)
    {
        try
        {
            return PORequestDAL.GetproductPrice(SupplierId, ProductsID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequest_GetPrice(): " + ex.Message);
            throw (ex);
        }

    }


    [WebMethod]
    public static int SaveOrUpdateSupplier(Supplier_FDSS SupplierObj)
    {
        try
        {
            return PORequestDAL.SaveOrUpdateSupplier(SupplierObj);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequest_SaveOrUpdateProducts(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static Supplier_FDSS BindSupplierForEdit(int SuppID)
    {
        try
        {
            return PORequestDAL.GetSupplierForEdit(SuppID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in PORequest_BindSupplierForEdit(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Supplier_FDSS BindPORequest()
    {
        Supplier_FDSS objAT = new Supplier_FDSS();
        Hashtable objHT = new Hashtable();

        DataTable dtObj = PORequestDAL.GetResultAsTable("BindPOrequestnumber", objHT);
        if (dtObj != null && dtObj.Rows.Count > 0)
        {

            if (dtObj.Rows[0]["PONumber"] != null && dtObj.Rows[0]["PONumber"].ToString() != "")
                objAT.PONumber = dtObj.Rows[0]["PONumber"].ToString();
        }
        return objAT;

    }
}