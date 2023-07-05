import '../../entities/enterprise_entity/enterprise_entity.dart';

abstract class EnterpriseRepository {
  Future<List<Enterprise>> getEnterprises();
  Future<Enterprise> getEnterprise(String id);
  Future<void> createEnterprise(Enterprise enterprise);
  Future<void> updateEnterprise(Enterprise enterprise);
  Future<void> updateEnterpriseStatus(String id, String status);
}
