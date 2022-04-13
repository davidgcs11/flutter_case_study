import 'package:flutter_case_study/models/employee.dart';
import 'package:flutter_case_study/models/store.dart';

enum EmployeeAction { textFilter, companyFilter }

EmployeeStore employeeReducer(EmployeeStore state, dynamic action) {
  final type = action["type"];
  switch (type) {
    case EmployeeAction.textFilter:
      final employees = _filterEmployees(state.allEmployees, action["value"]);
      return EmployeeStore(state.allEmployees, employees);
    default:
  }
  return state;
}

List<Employee> _filterEmployees(List<Employee> employees, String? query) {
  return employees.where((employee) {
    final searchTxt =
        '${employee.firstName} ${employee.lastName}'.toLowerCase();
    final queryStr = '$query'.toLowerCase();
    return searchTxt.contains(queryStr);
  }).toList();
}
