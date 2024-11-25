import 'package:betalent/core/errors/failures.dart';
import 'package:betalent/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

class GetAllEmployees implements UseCase<List<Employee>, NoParams> {
  const GetAllEmployees(this.repository);

  final EmployeeRepository repository;

  @override
  Future<Either<Failure, List<Employee>>> call(NoParams params) async {
    return repository.getAllEmployees();
  }
}
