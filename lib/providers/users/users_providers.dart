import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user_entity/user_entity.dart';
import '../../domain/repositories/user_repository/user_repository.dart';
import '../../infrastructure/repositories/user_repositories/user_repository_impl.dart';

final getUsersProvider = Provider.autoDispose<List<UserEntity>>((ref) {
  final users = [
    UserEntity(
      id: '1',
      name: 'Usuario 1',
      email: 'usuario1@example.com',
      phone: '+123456789',
      address: 'Dirección 1',
      license: 'Licencia 1',
      rating: 4.5,
      status: 'Activo',
    ),
    UserEntity(
      id: '2',
      name: 'Usuario 2',
      email: 'usuario2@example.com',
      phone: '+987654321',
      address: 'Dirección 2',
      license: 'Licencia 2',
      rating: 3.8,
      status: 'Inactivo',
    ),
    UserEntity(
      id: '3',
      name: 'Usuario 1',
      email: 'usuario3@example.com',
      phone: '+6574364356',
      address: 'Dirección 3',
      license: 'Licencia 3',
      rating: 4,
      status: 'Activo',
    ),
    UserEntity(
      id: '4',
      name: 'Usuario 4',
      email: 'usuario4@example.com',
      phone: '+345345345345',
      address: 'Dirección 4',
      license: 'Licencia 4',
      rating: 3,
      status: 'Activo',
    ),
    UserEntity(
      id: '5',
      name: 'Usuario 5',
      email: 'usuario5@example.com',
      phone: '+123123123',
      address: 'Dirección 5',
      license: 'Licencia 5',
      rating: 4.8,
      status: 'Activo',
    ),
    UserEntity(
      id: '6',
      name: 'Usuario 6',
      email: 'usuario1@example.com',
      phone: '+3456456456',
      address: 'Dirección 6',
      license: 'Licencia 6',
      rating: 3.5,
      status: 'Activo',
    ),
    UserEntity(
      id: '7',
      name: 'Usuario 7',
      email: 'usuario7@example.com',
      phone: '+123423489',
      address: 'Dirección 7',
      license: 'Licencia 7',
      rating: 4.6,
      status: 'Activo',
    )
  ];
  return users;
});

final getUserByIdProvider =
    FutureProvider.family<UserEntity, String>((ref, id) async {
  final userRepository = ref.watch(userRepositoryProvider);
  final user = await userRepository.getUserById(id);
  return user;
});

final updateUserProvider =
    FutureProvider.family<UpdateResult, UserEntity>((ref, user) async {
  final userRepository = ref.watch(userRepositoryProvider);
  final result = await userRepository.updateUser(user);
  return result;
});

final updateStatusProvider =
    FutureProvider.family<UpdateResult, Map<String, String>>((ref, data) async {
  final userRepository = ref.watch(userRepositoryProvider);
  final email = data['email'];
  final status = data['status'];

  if (email != null && status != null) {
    final result = await userRepository.updateStatus(email, status);
    return result;
  } else {
    throw Exception('Missing data');
  }
});

// Bridge
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});
