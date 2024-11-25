part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();
}

class EmployeeInitial extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class EmployeeLoading extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class EmployeeLoaded extends EmployeeState {
  const EmployeeLoaded({required this.employees});

  final List<Employee> employees;

  @override
  List<Object?> get props => [employees];
}

class EmployeeError extends EmployeeState {
  const EmployeeError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
