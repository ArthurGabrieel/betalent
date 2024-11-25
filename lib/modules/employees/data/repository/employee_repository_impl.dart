import 'package:betalent/core/errors/exceptions.dart';
import 'package:betalent/core/errors/failures.dart';
import 'package:betalent/modules/employees/data/datasources/employee_remote_data_source.dart';
import 'package:betalent/modules/employees/domain/entities/employee.dart';
import 'package:betalent/modules/employees/domain/repositories/employee_repository.dart';
import 'package:dartz/dartz.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  const EmployeeRepositoryImpl({required this.remoteDataSource});

  final EmployeeRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Employee>>> getAllEmployees() async {
    try {
      final employees = await remoteDataSource.getAllEmployees();
      return Right(employees);
    } on ServerException {
      return const Left(ServerFailure('Houve um erro ao buscar os dados.'));
    }
  }
}
