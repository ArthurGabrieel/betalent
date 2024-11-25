import 'dart:convert';

import 'package:betalent/core/api/endpoints.dart';
import 'package:betalent/core/api/http_client.dart';
import 'package:betalent/core/errors/exceptions.dart';
import 'package:betalent/modules/employees/data/models/employee_model.dart';

abstract class EmployeeRemoteDataSource {
  Future<List<EmployeeModel>> getAllEmployees();
}

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  const EmployeeRemoteDataSourceImpl({required this.client});

  final HttpClient client;

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    final response = await client.get(Endpoints.getAllEmployees);

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.data);
      return jsonResponse.map((json) => EmployeeModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
