class ClientEntity {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? license;
  final double? rating;
  final String status;

  ClientEntity({
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

class DriverEntity {
  final String id;
  final String email;
  final String name;
  final String license;
  final String phoneNumber;
  final String address;

  DriverEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.license,
    required this.phoneNumber,
    required this.address,
  });
}