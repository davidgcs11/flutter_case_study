import 'package:flutter_case_study/models/employee.dart';

class EmployeeStore {
  final List<Employee> allEmployees;
  final List<Employee> employees;

  EmployeeStore(this.allEmployees, this.employees);
}
