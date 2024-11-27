import 'package:betalent/core/helpers/date_helper.dart';
import 'package:betalent/core/helpers/string_helper.dart';
import 'package:betalent/core/util/dashed_line_painter.dart';
import 'package:betalent/modules/employees/domain/entities/employee.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatefulWidget {
  const EmployeeTile({super.key, required this.employee});

  final Employee employee;

  @override
  State<EmployeeTile> createState() => _EmployeeTileState();
}

class _EmployeeTileState extends State<EmployeeTile>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  Widget _buildRowText(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => isExpanded = !isExpanded);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        child: ClipRect(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(widget.employee.image),
                    ),
                    const SizedBox(width: 40),
                    Text(
                      widget.employee.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 32,
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 26),
                  _buildRowText('Cargo', widget.employee.job),
                  DashedLinePainter.build(),
                  _buildRowText(
                    'Data de admissão',
                    widget.employee.admissionDate.toFormattedString(),
                  ),
                  DashedLinePainter.build(),
                  _buildRowText(
                    'Telefone',
                    widget.employee.phone.formatPhoneNumber(),
                  ),
                  DashedLinePainter.build(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
