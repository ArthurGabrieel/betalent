import 'package:betalent/core/config/style/theme.dart';
import 'package:betalent/core/service_locator.dart';
import 'package:betalent/modules/employees/presentation/bloc/employee_bloc.dart';
import 'package:betalent/modules/employees/presentation/pages/employees_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EmployeeBloc>(),
      child: MaterialApp(
        theme: AppTheme.light,
        home: const EmployeesPage(),
      ),
    );
  }
}
