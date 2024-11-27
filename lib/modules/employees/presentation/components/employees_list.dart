import 'package:betalent/modules/employees/domain/entities/employee.dart';
import 'package:betalent/modules/employees/presentation/components/employee_tile.dart';
import 'package:betalent/modules/employees/presentation/components/employees_header.dart';
import 'package:flutter/material.dart';

class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key, required this.employees});

  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EmployeesHeader(),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: employees.length,
          itemBuilder: (context, index) {
            return EmployeeTile(
              employee: employees[index],
            );
          },
        ),
        if (employees.isEmpty) ...[
          const SizedBox(height: 20),
          const Text(
            'Nenhum funcionário encontrado',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}
