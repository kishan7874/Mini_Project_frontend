namespace QuickKart10Min.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public decimal Price { get; set; }
        public string Unit { get; set; }
        public string Image { get; set; }
        public bool Popular { get; set; }
    }
}
