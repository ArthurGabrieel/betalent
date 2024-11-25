import 'package:betalent/core/api/http_client.dart';
import 'package:betalent/modules/employees/data/datasources/employee_remote_data_source.dart';
import 'package:betalent/modules/employees/data/repository/employee_repository_impl.dart';
import 'package:betalent/modules/employees/domain/repositories/employee_repository.dart';
import 'package:betalent/modules/employees/domain/usecases/get_all_employees.dart';
import 'package:betalent/modules/employees/presentation/bloc/employee_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // Bloc
  sl.registerFactory(() => EmployeeBloc(getAllEmployees: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllEmployees(sl()));

  // Repository
  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<EmployeeRemoteDataSource>(
    () => EmployeeRemoteDataSourceImpl(client: sl()),
  );

  // Core
  sl.registerLazySingleton<HttpClient>(() => HttpClient(sl()));

  // External
  sl.registerLazySingleton<Dio>(Dio.new);
}
