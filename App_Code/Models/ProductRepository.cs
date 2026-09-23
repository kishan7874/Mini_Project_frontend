using System.Collections.Generic;
using System.Linq;

namespace QuickKart10Min.Models
{
    public static class ProductRepository
    {
        public static List<Product> All = new List<Product>
        {
            new Product { Id=1, Name="Fresh Bananas", Category="Fruits", Price=49, Unit="1 kg", Image="banana.svg", Popular=true },
            new Product { Id=2, Name="Red Apples", Category="Fruits", Price=159, Unit="1 kg", Image="apple.svg", Popular=true },
            new Product { Id=3, Name="Full Cream Milk", Category="Dairy", Price=67, Unit="1 litre", Image="milk.svg", Popular=true },
            new Product { Id=4, Name="Brown Bread", Category="Bakery", Price=45, Unit="400 g", Image="bread.svg", Popular=true },
            new Product { Id=5, Name="Farm Fresh Eggs", Category="Dairy", Price=89, Unit="12 pcs", Image="eggs.svg", Popular=true },
            new Product { Id=6, Name="Potatoes", Category="Vegetables", Price=39, Unit="1 kg", Image="potato.svg", Popular=false },
            new Product { Id=7, Name="Fresh Tomatoes", Category="Vegetables", Price=49, Unit="1 kg", Image="tomato.svg", Popular=true },
            new Product { Id=8, Name="Classic Potato Chips", Category="Snacks", Price=20, Unit="52 g", Image="chips.svg", Popular=true },
            new Product { Id=9, Name="Cola Soft Drink", Category="Beverages", Price=45, Unit="750 ml", Image="cola.svg", Popular=false },
            new Product { Id=10, Name="Instant Noodles", Category="Snacks", Price=76, Unit="4 pack", Image="noodles.svg", Popular=true },
            new Product { Id=11, Name="Basmati Rice", Category="Staples", Price=349, Unit="5 kg", Image="rice.svg", Popular=false },
            new Product { Id=12, Name="Dishwash Liquid", Category="Home Care", Price=109, Unit="500 ml", Image="cleaner.svg", Popular=false }
        };

        public static Product Get(int id)
        {
            return All.FirstOrDefault(p => p.Id == id);
        }
    }
}
