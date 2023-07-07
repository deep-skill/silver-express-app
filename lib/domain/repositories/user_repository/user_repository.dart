import '../../entities/user_entity/user_entity.dart';

abstract class UserRepository {
  Future<List<ClientEntity>> getUsers();
  Future<ClientEntity> getUserById(String id);
  Future<UpdateResult> updateUser(ClientEntity user);
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
