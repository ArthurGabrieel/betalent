import 'package:betalent/core/helpers/shimmer_helper.dart';
import 'package:betalent/modules/employees/presentation/components/employees_header.dart';
import 'package:flutter/material.dart';

class EmployeesShimmer extends StatelessWidget {
  const EmployeesShimmer({super.key});

  Widget _buildShimmerEmployeeTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
      ),
      child: ListTile(
        leading: ShimmerHelper.circular(
          size: 40,
        ),
        title: ShimmerHelper.rectangular(
          height: 10,
        ),
        trailing: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey.shade300,
          size: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
          const TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Column(
            children: [
              const EmployeesHeader(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (_, index) => _buildShimmerEmployeeTile(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
