import 'package:betalent/core/usecase/usecase.dart';
import 'package:betalent/modules/employees/domain/entities/employee.dart';
import 'package:betalent/modules/employees/domain/usecases/get_all_employees.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetAllEmployees getAllEmployees;

  List<Employee> allEmployees = [];

  EmployeeBloc({required this.getAllEmployees}) : super(EmployeeInitial()) {
    on<FetchEmployeesEvent>((event, emit) async {
      emit(EmployeeLoading());
      final result = await getAllEmployees(NoParams());

      result.fold(
        (failure) => emit(EmployeeError(message: failure.message)),
        (employees) {
          allEmployees = employees;
          emit(EmployeeLoaded(employees: employees));
        },
      );
    });

    on<FilterEmployeesEvent>((event, emit) async {
      if (event.query.isEmpty) {
        emit(EmployeeLoaded(employees: allEmployees));
      } else {
        final filteredEmployees = allEmployees.where((employee) {
          return employee.name.toLowerCase().contains(event.query) ||
              employee.job.toLowerCase().contains(event.query) ||
              employee.phone.contains(event.query);
        }).toList();

        emit(EmployeeLoaded(employees: filteredEmployees));
      }
    });
  }
}
