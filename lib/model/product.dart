import 'category.dart';

class Product {
  final int id;
  final String title;
  final String slug;
  final String price;
  final String description;
  final Category category;
  final List<String> images ;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images
});

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
        id: json['id'],
        title: json['title'],
        slug: json['slug'],
        price: json['price'].toString(),
        description: json['description'],
        category: Category.fromJson(json['category']),
        images: List<String>.from(json['images']));
  }

}