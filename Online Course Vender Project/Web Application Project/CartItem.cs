using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Application_Project
{
    //The CartItem class represents a product that the user has added to the
    //shopping cart plus the quantity ordered.
    public class CartItem
    {
        //Constructors that create an empty CartItem object or one with values.
        public CartItem() { }

        public CartItem(Product product)
        {
            this.Product = product;
        }

        //These are public properties for a CartItem object.
        public Product Product { get; set; }

        //This is a method that formats an item's name, quantity, and price in
        //a single line that can be used in the Cart.
        public string Display()
        {
            string displayString = string.Format("{0} at {1}",
                Product.ProductName,
                Product.UnitPrice.ToString("c"));
            return displayString;
        }
    }
}