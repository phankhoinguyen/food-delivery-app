var desc =
    "This is a special types of tiems, often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a 'specialItems sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns.";

class ProductModel {
  final String imageCard;
  final String id;
  final String imageDetail;
  final String name;
  final double price;
  final double rate;
  final String geoID;
  final String geolink;
  final String category;
  final int kcal;
  final String unit;

  ProductModel({
    required this.imageCard,
    required this.imageDetail,
    required this.name,
    required this.price,
    required this.rate,
    required this.geoID,
    required this.geolink,
    required this.category,
    required this.kcal,
    required this.unit,
    required this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      imageCard: json['imageCard'] ?? '',
      imageDetail: json['imageDetail'] ?? '',
      name: json['name'] ?? 'Unknown',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      geoID: json['geoID'] ?? '',
      geolink: json['geolink'] ?? '',
      category: json['category'] ?? '',
      kcal: json['kcal'] ?? '',
      unit: json['unit'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageCard': imageCard,
      'imageDetail': imageDetail,
      'name': name,
      'price': price,
      'rate': rate,
      'geoID': geoID,
      'geolink': geolink,
      'category': category,
      'kcal': kcal,
      'unit': unit,
    };
  }
}
