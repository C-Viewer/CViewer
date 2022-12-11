import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.biography,
    required this.rating,
    required this.isExpert,
    required this.speciality,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String biography;
  final double? rating;
  final bool isExpert;
  final String speciality;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        biography,
        rating,
        isExpert,
        speciality,
      ];

  String get fullName => '$firstName $lastName';
}
