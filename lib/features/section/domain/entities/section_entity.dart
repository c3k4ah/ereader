import 'package:equatable/equatable.dart';

class SectionEntity extends Equatable {
  const SectionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  final String id;
  final String title;
  final String description;
  final DateTime date;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        date,
      ];
}
