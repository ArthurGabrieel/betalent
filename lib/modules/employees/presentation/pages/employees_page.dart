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
  late TextEditingController _searchController;
  String _searchText = '';

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmployeeBloc>().add(FetchEmployeesEvent());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            runSpacing: 20,
            children: [
              const Text(
                'Funcionários',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchText = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search),
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
                          final filteredEmployees = employees.where((employee) {
                            return employee.name
                                    .toLowerCase()
                                    .contains(_searchText) ||
                                employee.job
                                    .toLowerCase()
                                    .contains(_searchText) ||
                                employee.phone.contains(_searchText);
                          }).toList();

                          if (filteredEmployees.isEmpty) {
                            return const Center(
                              child: Text('Nenhum funcionário encontrado.'),
                            );
                          }

                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filteredEmployees.length,
                            itemBuilder: (context, index) {
                              final employee = filteredEmployees[index];
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
