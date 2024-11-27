import 'package:betalent/modules/employees/presentation/bloc/employee_bloc.dart';
import 'package:betalent/modules/employees/presentation/components/custom_app_bar.dart';
import 'package:betalent/modules/employees/presentation/components/employee_tile.dart';
import 'package:betalent/modules/employees/presentation/components/employees_header.dart';
import 'package:betalent/modules/employees/presentation/components/list_employees_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmployeeBloc>().add(FetchEmployeesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            runSpacing: 16,
            children: [
              const Text(
                'Funcionários',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Column(
                children: [
                  const EmployeesHeader(),
                  BlocBuilder<EmployeeBloc, EmployeeState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const ListEmployeesShimmer(),
                        loaded: (employees) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: employees.length,
                            itemBuilder: (context, index) {
                              final employee = employees[index];
                              return EmployeeTile(employee: employee);
                            },
                          );
                        },
                        error: (message) => Center(
                          child: Text(message),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
