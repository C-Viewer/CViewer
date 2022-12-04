class Profile {
  const Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.rating,
    required this.isExpert,
    required this.specialization,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String description;
  final double rating;
  final bool isExpert;
  final String specialization;
}
