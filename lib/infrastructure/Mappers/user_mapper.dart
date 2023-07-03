import '../../domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      address: map['address'] as String?,
      license: map['license'] as String?,
      rating:
          map['rating'] != null ? double.parse(map['rating'].toString()) : null,
      status: map['status'] as String,
    );
  }

  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'address': user.address,
      'license': user.license,
      'rating': user.rating,
      'status': user.status,
    };
  }
}
