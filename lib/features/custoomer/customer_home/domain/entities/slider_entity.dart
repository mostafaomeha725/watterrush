import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  final int id;
  final String image;
  final String buttonLink;
  final String tag;
  final String title;
  final String description;
  final String buttonText;
  final int sortOrder;

  const SliderEntity({
    required this.id,
    required this.image,
    required this.buttonLink,
    required this.tag,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        buttonLink,
        tag,
        title,
        description,
        buttonText,
        sortOrder,
      ];
}
