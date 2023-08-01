class Product {
  final String brand;
  final String img;
  final String name;
  final String price;
  final String size;

  Product({
    required this.brand,
    required this.img,
    required this.name,
    required this.price,
    required this.size,
  });

  static Product fromJson(Map<String, dynamic> json) => Product(
    brand: json["brand"].toString(),
    img: json["img"].toString(),
    name: json["name"].toString(),
    price: json["price"].toString(),
    size: json["size"].toString());

  Map<String, dynamic> toJson() => {
    "brand" : brand,
    "img" : img,
    "name" : name,
    "price" : price,
    "size" : size,
  };

  // void add(Product fromJson) {}
}