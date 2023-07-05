import '../../entities/user_entity/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> getUserById(String id);
  Future<UpdateResult> updateUser(UserEntity user);
  Future<UpdateResult> updateStatus(String email, String status);
}

class UpdateResult {
  final bool success;
  final String id;

  UpdateResult({
    required this.success,
    required this.id,
  });
}
