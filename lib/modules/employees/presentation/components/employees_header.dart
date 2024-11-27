import 'package:flutter/material.dart';

class EmployeesHeader extends StatelessWidget {
  const EmployeesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
      ),
      child: const ListTile(
        leading: Text(
          'FOTO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        title: Text(
          'NOME',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: Icon(
          Icons.circle,
          color: Colors.black,
          size: 16,
        ),
      ),
    );
  }
}
