import 'package:betalent/modules/employees/domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required super.id,
    required super.name,
    required super.job,
    required super.admissionDate,
    required super.phone,
    required super.image,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      admissionDate: DateTime.parse(json['admission_date']),
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'admission_date': admissionDate.toIso8601String(),
      'phone': phone,
      'image': image,
    };
  }
}
