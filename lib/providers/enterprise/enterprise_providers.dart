import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/enterprise_entity/enterprise_entity.dart';
import '../../domain/repositories/enterprise_repository/enterprise_repository.dart';
import '../../infrastructure/repositories/enterprise_repository/enterprise_repository_impl.dart';

final getEnterprisesProvider = Provider.autoDispose<List<Enterprise>>((ref) {
  final enterprises = [
    Enterprise(
      id: '1',
      ruc: '123456789',
      name: 'Personal',
      address: 'Dirección A',
      status: 'Activo',
    ),
    Enterprise(
      id: '2',
      ruc: '987654321',
      name: 'OI-GMEC',
      address: 'Dirección B',
      status: 'Activo',
    ),
    Enterprise(
      id: '3',
      ruc: '987612321',
      name: 'LIMA EXPRESA',
      address: 'Dirección C',
      status: 'Activo',
    ),
    Enterprise(
      id: '4',
      ruc: '987652341',
      name: 'TMS',
      address: 'Dirección D',
      status: 'Activo',
    ),
    Enterprise(
      id: '5',
      ruc: '987654321',
      name: "B'MOBILE",
      address: 'Dirección E',
      status: 'Activo',
    ),
  ];

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
