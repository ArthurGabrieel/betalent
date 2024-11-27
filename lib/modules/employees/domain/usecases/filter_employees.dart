import 'package:betalent/core/errors/failures.dart';
import 'package:betalent/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

class FilterEmployees implements UseCase<List<Employee>, FilterParams> {
  const FilterEmployees(this.repository);

  final EmployeeRepository repository;

  @override
  Future<Either<Failure, List<Employee>>> call(FilterParams params) async {
    return repository.getAllEmployees();
  }
}

class FilterParams {
  const FilterParams(this.query, this.employees);

  final String query;
  final List<Employee> employees;
}
