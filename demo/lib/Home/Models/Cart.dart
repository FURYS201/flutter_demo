class Products {
  final String name;

  final String price;
  final String image;

  Products(this.name, this.price, this.image);
  factory Products.fromMap(Map<String, dynamic> json) {
    return Products(
      json['name'],
      json['price'],
      json['image'],
    );
  }
}
