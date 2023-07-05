import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity/user_entity.dart';
import '../../domain/repositories/user_repository/user_repository.dart';
import '../../infrastructure/repositories/user_repositories/user_repository_impl.dart';

final getUsersProvider =
    FutureProvider.autoDispose<List<UserEntity>>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  final users = await userRepository.getUsers();
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
