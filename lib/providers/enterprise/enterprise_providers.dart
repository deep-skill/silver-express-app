import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/enterprise_entity/enterprise_entity.dart';
import '../../domain/repositories/enterprise_repository/enterprise_repository.dart';
import '../../infrastructure/repositories/enterprise_repository/enterprise_repository_impl.dart';

final getEnterprisesProvider =
    FutureProvider.autoDispose<List<Enterprise>>((ref) async {
  final enterpriseRepository = ref.watch(enterpriseRepositoryProvider);
  final enterprises = await enterpriseRepository.getEnterprises();
  return enterprises;
});

final getEnterpriseProvider =
    FutureProvider.family<Enterprise, String>((ref, id) async {
  final enterpriseRepository = ref.watch(enterpriseRepositoryProvider);
  final enterprise = await enterpriseRepository.getEnterprise(id);
  return enterprise;
});

final createEnterpriseProvider =
    FutureProvider.family<void, Enterprise>((ref, Enterprise enterprise) async {
  final enterpriseRepository = ref.watch(enterpriseRepositoryProvider);
  await enterpriseRepository.createEnterprise(enterprise);
});

final updateEnterpriseProvider =
    FutureProvider.family<void, Enterprise>((ref, Enterprise enterprise) async {
  final enterpriseRepository = ref.watch(enterpriseRepositoryProvider);
  await enterpriseRepository.updateEnterprise(enterprise);
});

final updateEnterpriseStatusProvider =
    FutureProvider.family<void, Map<String, String>>((ref, data) async {
  final enterpriseRepository = ref.watch(enterpriseRepositoryProvider);
  final id = data['id'];
  final status = data['status'];

  if (id != null && status != null) {
    await enterpriseRepository.updateEnterpriseStatus(id, status);
  } else {
    throw Exception('Missing data');
  }
});

final enterpriseRepositoryProvider = Provider<EnterpriseRepository>((ref) {
  return EnterpriseRepositoryImpl();
});
