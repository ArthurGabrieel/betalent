import 'package:betalent/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/employee.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getAllEmployees();
}
