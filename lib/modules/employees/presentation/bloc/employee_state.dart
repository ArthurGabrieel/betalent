part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  EmployeeLoaded get _asLoaded => this as EmployeeLoaded;
  EmployeeError get _asError => this as EmployeeError;

  T when<T>({
    required T Function() loading,
    required T Function(List<Employee> employees) loaded,
    required T Function(String message) error,
  }) {
    if (this is EmployeeLoading) {
      return loading();
    } else if (this is EmployeeLoaded) {
      return loaded(_asLoaded.employees);
    } else if (this is EmployeeError) {
      return error(_asError.message);
    } else if (this is EmployeeInitial) {
      return loading();
    } else {
      throw Exception('Unknown state: $this');
    }
  }
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
