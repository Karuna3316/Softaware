using Newtonsoft.Json;
using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.Services;

public partial class Products_Bulk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Page load logic
    }

    [WebMethod]
    public static string SaveData(string jsonData)
    {
        try
        {
            // Deserialize the JSON data into a list of DeviceMappingBulk objects
            List<DeviceMappingBulk> DeviceMappingBulkList = JsonConvert.DeserializeObject<List<DeviceMappingBulk>>(jsonData);

            // Establish the database connection
            string connectionString = System.Configuration.ConfigurationManager.AppSettings["dbConStr"];

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Products_Bulk", con))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Open the connection
                    con.Open();

                    // Iterate over the DeviceMappingBulkList and insert or update the data in the database
                    foreach (var DMData in DeviceMappingBulkList)
                    {
                        // Retrieve the properties from the DeviceMappingBulk object
                        string Make = DMData.Make;
                        string Supplier = DMData.Supplier;
                        string Product = DMData.Product;
                        string Size = DMData.Size;
                        string HSN = DMData.HSN;
                        int Qty = DMData.Qty;
                        decimal LPrice = DMData.LPrice;
                        

                       
                        // Execute the stored procedure and pass the parameters
                        command.Parameters.Clear(); // Clear any existing parameters
                        command.Parameters.AddWithValue("@Make", Make);
                        command.Parameters.AddWithValue("@Supplier", Supplier);
                        command.Parameters.AddWithValue("@ProductsName", Product);
                        command.Parameters.AddWithValue("@Size", Size);
                        command.Parameters.AddWithValue("@Hsn", HSN);
                        command.Parameters.AddWithValue("@MinQty", Qty);
                        command.Parameters.AddWithValue("@LPrice", LPrice);

                        // Execute the stored procedure for each DeviceMappingBulk object
                        command.ExecuteNonQuery();
                    }
                }
            }

            // Data saved successfully, now retrieve the data from the database and return it as JSON
            return "Done !";
        }
        catch (Exception ex)
        {
            // Return an error message
            return "Failed to save data: " + ex.Message;
        }
    }
    public class DeviceMappingBulk
    {
        public string Make { get; set; }
        public string Supplier { get; set; }
        public string Product { get; set; }
        public string Size { get; set; }
        public string HSN { get; set; }
        public int Qty { get; set; }
        public decimal LPrice { get; set; }
    }

}
