import 'package:dio/dio.dart';
import 'package:silver/infrastructure/mappers/user_mappers/user_mapper.dart';

import '../../../domain/entities/user_entity/user_entity.dart';
import '../../../domain/repositories/user_repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:6104'));

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      final response = await _dio.get('/user/');
      final data = response.data as List<dynamic>?;

      if (data != null && data.isNotEmpty) {
        final users =
            data.map((userData) => UserMapper.fromMap(userData)).toList();
        return users;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Failed to fetch users ');
    }
  }

  @override
  Future<UserEntity> getUserById(String id) async {
    try {
      final response = await _dio.get('/users/$id');
      final data = response.data as Map<String, dynamic>;
      final user = UserMapper.fromMap(data);
      return user;
    } catch (e) {
      throw Exception('Failed to fetch user');
    }
  }

  @override
  Future<UpdateResult> updateUser(UserEntity user) async {
    const url = '/users/update';

    try {
      final response = await _dio.put(url, data: UserMapper.toJson(user));
      final data = response.data as Map<String, dynamic>;
      final updateResult = UpdateResult(
        success: data['Update'] as bool,
        id: data['Id'] as String,
      );
      return updateResult;
    } catch (e) {
      throw Exception('Failed to update user');
    }
  }

  @override
  Future<UpdateResult> updateStatus(String email, String status) async {
    const url = '/users/status';

    try {
      final response =
          await _dio.put(url, data: {'email': email, 'status': status});
      final data = response.data as Map<String, dynamic>;
      final updateResult = UpdateResult(
        success: data['Update'] as bool,
        id: data['Id'] as String,
      );
      return updateResult;
    } catch (e) {
      throw Exception('Failed to update user status');
    }
  }
}
