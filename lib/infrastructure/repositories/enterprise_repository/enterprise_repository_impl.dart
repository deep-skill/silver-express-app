import 'package:dio/dio.dart';

import '../../../domain/entities/enterprise_entity/enterprise_entity.dart';
import '../../../domain/repositories/enterprise_repository/enterprise_repository.dart';
import '../../mappers/enterprise_mappers/enterprise_mapper.dart';

class EnterpriseRepositoryImpl implements EnterpriseRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:6104'));

  EnterpriseRepositoryImpl();

  @override
  Future<List<Enterprise>> getEnterprises() async {
    try {
      final response = await _dio.get('/enterprises');
      final List<dynamic> enterpriseDataList = response.data;
      return enterpriseDataList
          .map((data) => EnterpriseMapper.fromMap(data))
          .toList();
    } catch (error) {
      throw Exception('Failed to fetch enterprises');
    }
  }

  @override
  Future<Enterprise> getEnterprise(String id) async {
    try {
      final response = await _dio.get('/enterprises/$id');
      final dynamic enterpriseData = response.data;
      return EnterpriseMapper.fromMap(enterpriseData);
    } catch (error) {
      throw Exception('Failed to fetch enterprise');
    }
  }

  @override
  Future<void> createEnterprise(Enterprise enterprise) async {
    try {
      final enterpriseData = EnterpriseMapper.toJson(enterprise);
      await _dio.post('/enterprises', data: enterpriseData);
    } catch (error) {
      throw Exception('Failed to create enterprise');
    }
  }

  @override
  Future<void> updateEnterprise(Enterprise enterprise) async {
    try {
      final enterpriseData = EnterpriseMapper.toJson(enterprise);
      await _dio.put('/enterprises/${enterprise.id}', data: enterpriseData);
    } catch (error) {
      throw Exception('Failed to update enterprise');
    }
  }

  @override
  Future<void> updateEnterpriseStatus(String id, String status) async {
    try {
      await _dio.put('/enterprises/$id/status', data: {'status': status});
    } catch (error) {
      throw Exception('Failed to update enterprise status');
    }
  }
}
