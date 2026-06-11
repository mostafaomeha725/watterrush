import '../../domain/entities/slider_entity.dart';

class SliderModel extends SliderEntity {
  const SliderModel({
    required super.id,
    required super.image,
    required super.buttonLink,
    required super.tag,
    required super.title,
    required super.description,
    required super.buttonText,
    required super.sortOrder,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      image: json['image'] ?? '',
      buttonLink: json['button_link'] ?? '',
      tag: json['tag'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      buttonText: json['button_text'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
    );
  }
}
