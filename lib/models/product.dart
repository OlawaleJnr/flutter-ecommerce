class Product {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  /// This is a named constructor. It is used to create a new instance of the Product class.
  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  /// A method responsible for converting our product fields into JSON/MAP format.
  /// It takes an id and returns a map of the product's properties
  /// 
  /// Args: id (String): The id of the product.
  /// 
  /// Returns: A map of the product's data.
  Map<String, dynamic> toMap(String id) {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  Product.fromMap(Map<String, dynamic> map) :
  id = map['id'] ?? "",
  name = map['name'] ?? "",
  description = map['description'] ?? "",
  price = map['price'] ?? 0.0,
  imageUrl = map['imageUrl'] ?? "";
}