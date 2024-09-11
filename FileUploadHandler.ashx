<%@ WebHandler Language="C#" Class="FileUploadHandler" %>

using System;
using System.Web;
using System.IO;

public class FileUploadHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
            Utilities.LogErrorToFile("inside the handler");
            string username="";
            if (context.Request["username"] != null)
                username = context.Request["username"].ToString();
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                try
                {
                    HttpPostedFile file = files[i];

                    string uploadfile = file.FileName.Substring(file.FileName.LastIndexOf("\\") + 1);
                    //uploadfile = uploadfile.Replace(" ", "").ToLower();
                    Utilities.LogErrorToFile(uploadfile);
                    string fname = System.Configuration.ConfigurationManager.AppSettings["FileFolder"] + "\\";//+ username + "\\"
                    Utilities.LogErrorToFile(fname);
                    if (!Directory.Exists(fname))
                    {
                        Directory.CreateDirectory(fname);
                    }

                    file.SaveAs(fname + uploadfile);
                }
                catch (Exception e)
                {
                    Utilities.LogErrorToFile(e.Message);
                    Utilities.LogErrorToFile(e.InnerException.StackTrace);
                }
               }
        }
    }
        
    
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
