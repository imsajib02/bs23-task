class Product {

  int? id;
  String? title;
  String? description;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Product({this.id, this.title, this.description, this.price, this.discountPercentage, this.rating,
    this.stock, this.brand, this.category, this.thumbnail, this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    price = json['price'] == null ? 0.0 : double.parse(json['price'].toString());
    discountPercentage = json['discountPercentage'] == null ? 0.0 : double.parse(json['discountPercentage'].toString());
    rating = json['rating'] == null ? 0.0 : double.parse(json['rating'].toString());
    stock = json['stock'] ?? 0;
    brand = json['brand'] ?? '';
    category = json['category'] ?? '';
    thumbnail = json['thumbnail'] ?? '';
    images = json['images'] == null ? [] : json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
