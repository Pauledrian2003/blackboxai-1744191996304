class Property {
  final String id;
  final String title;
  final String description;
  final double price;
  final String location;
  final List<String> images;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String ownerId;
  final DateTime createdAt;
  final PropertyType type;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.images,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.ownerId,
    required this.createdAt,
    required this.type,
  });
}

enum PropertyType {
  apartment,
  house,
  condo,
  land,
  commercial,
}
