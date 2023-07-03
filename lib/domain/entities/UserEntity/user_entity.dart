class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? license;
  final double? rating;
  final String status;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.license,
    this.rating,
    required this.status,
  });
}
