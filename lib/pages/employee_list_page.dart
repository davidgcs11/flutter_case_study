import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/company.dart';
import 'package:flutter_case_study/models/employee.dart';
import 'package:flutter_case_study/models/store.dart';
import 'package:flutter_case_study/pages/components/employee_card.dart';
import 'package:flutter_case_study/pages/components/employee_filter.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Case study'),
      ),
      body: Column(
        children: [
          const EmployeeFilter(),
          Expanded(
            child: StoreConnector<List<Company>, List<Company>>(
              converter: (companies) => companies.state,
              builder: (_, companies) {
                return StoreConnector<EmployeeStore, List<Employee>>(
                  converter: (employees) => employees.state.employees,
                  builder: (context, employees) {
                    return ListView.builder(
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        final company = companies.firstWhere(
                          (c) => c.id == employee.companyId,
                        );
                        return EmployeeCard(
                          employee: employee,
                          company: company,
                        );
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
