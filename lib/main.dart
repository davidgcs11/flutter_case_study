import 'package:flutter/material.dart';
import 'package:flutter_case_study/core/utils.dart';
import 'package:flutter_case_study/models/company.dart';
import 'package:flutter_case_study/models/employee.dart';
import 'package:flutter_case_study/models/store.dart';
import 'package:flutter_case_study/pages/employee_list_page.dart';
import 'package:flutter_case_study/redux/company_reducer.dart';
import 'package:flutter_case_study/redux/employee_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final employeesStr = await readJsonList('assets/data/employee_data.json');
  final employees = employeesStr.map((m) => Employee.fromJson(m)).toList();
  final employeeStore = Store<EmployeeStore>(
    employeeReducer,
    initialState: EmployeeStore(employees, employees),
  );

  final companiesStr = await readJsonList('assets/data/company_data.json');
  final companies = companiesStr.map((c) => Company.fromJson(c)).toList();
  final companyStore = Store<List<Company>>(
    companyReducer,
    initialState: companies,
  );
  runApp(MyApp(
    employeeStore: employeeStore,
    companyStore: companyStore,
  ));
}

class MyApp extends StatelessWidget {
  final Store<EmployeeStore> employeeStore;
  final Store<List<Company>> companyStore;
  const MyApp({
    Key? key,
    required this.employeeStore,
    required this.companyStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<Company>>(
      store: companyStore,
      child: StoreProvider<EmployeeStore>(
        store: employeeStore,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const EmployeeListPage(),
          onUnknownRoute: (settings) =>
              MaterialPageRoute(builder: (context) => const EmployeeListPage()),
        ),
      ),
    );
  }
}
