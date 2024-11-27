part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

class FetchEmployeesEvent extends EmployeeEvent {
  @override
  List<Object?> get props => [];
}

class FilterEmployeesEvent extends EmployeeEvent {
  const FilterEmployeesEvent(this.query, this.employees);

  final String query;
  final List<Employee> employees;

  @override
  List<Object?> get props => [query, employees];
}
