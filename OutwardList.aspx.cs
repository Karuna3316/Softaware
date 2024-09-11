using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OutwardList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static Outwardobj GetOutwardList()
    {
        try
        {
            Outwardobj objLstLR = OutwardDAL.GetOutwardList();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in OutwardList_GetOutwardList(): " + ex.Message);
            throw (ex);
        }
    }

        [WebMethod]
         public static int DeleteOutward(int lReqId)
        {
            try
          {
            int affectedRows = 0;
            affectedRows = OutwardDAL.DeleteOutward(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in OutwardList_DeleteOutward(): " + ex.Message);
            throw (ex);
        }

    }

    }

  