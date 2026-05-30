import '../../domain/entities/slider_entity.dart';

class SliderModel extends SliderEntity {
  const SliderModel({
    required super.id,
    required super.image,
    required super.link,
    required super.sortOrder,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      image: json['image'] ?? '',
      link: json['link'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
    );
  }
}
