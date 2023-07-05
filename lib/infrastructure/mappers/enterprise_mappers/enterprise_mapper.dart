import '../../../domain/entities/enterprise_entity/enterprise_entity.dart';

class EnterpriseMapper {
  static Enterprise fromMap(Map<String, dynamic> map) {
    return Enterprise(
      id: map['id'] as String,
      ruc: map['ruc'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      status: map['status'] as String,
    );
  }

  static Map<String, dynamic> toJson(Enterprise enterprise) {
    return {
      'id': enterprise.id,
      'ruc': enterprise.ruc,
      'name': enterprise.name,
      'address': enterprise.address,
      'status': enterprise.status,
    };
  }
}
