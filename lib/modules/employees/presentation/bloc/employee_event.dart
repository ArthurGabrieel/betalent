part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

class FetchEmployeesEvent extends EmployeeEvent {
  @override
  List<Object?> get props => [];
}
