import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  final int id;
  final String image;
  final String link;
  final int sortOrder;

  const SliderEntity({
    required this.id,
    required this.image,
    required this.link,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [id, image, link, sortOrder];
}