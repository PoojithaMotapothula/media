class Product {
  List<ProductItem>? products;

  Product({this.products});

  factory Product.fromJson(Map<String, dynamic> json) {
    List<dynamic> productList = json['products'];
    List<ProductItem> productsList = productList
        .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return Product(products: productsList);
  }
}

class ProductItem {
  String? title;
  double? price;
  String? brand;
  String? category;
  String? description;
  List<String>? images;

  ProductItem({this.title, this.price, this.brand, this.images, this.category, this.description});

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    List<dynamic> imageList = json['images'];
    List<String> imagesList = imageList.map((e) => e.toString()).toList();

    return ProductItem(
      title: json['title'],
      price: json['price']?.toDouble(),
      brand: json['brand'],
      category: json['category'],
      description: json['description'],
      images: imagesList,
    );
  }
}