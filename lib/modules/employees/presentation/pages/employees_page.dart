import 'package:betalent/modules/employees/presentation/bloc/employee_bloc.dart';
import 'package:betalent/modules/employees/presentation/components/custom_app_bar.dart';
import 'package:betalent/modules/employees/presentation/components/employees_list.dart';
import 'package:betalent/modules/employees/presentation/components/employees_shimmer.dart';
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
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          return state.when(
            loading: () => const EmployeesShimmer(),
            error: (message) => Center(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            loaded: (employees) {
              return SingleChildScrollView(
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
                          _searchText = value.toLowerCase();
                          context.read<EmployeeBloc>().add(
                                FilterEmployeesEvent(_searchText, employees),
                              );
                        },
                        decoration: const InputDecoration(
                          hintText: 'Pesquisar',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      EmployeesList(employees: employees),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
