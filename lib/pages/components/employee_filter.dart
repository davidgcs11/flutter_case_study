import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/store.dart';
import 'package:flutter_case_study/redux/employee_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EmployeeFilter extends StatelessWidget {
  const EmployeeFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<EmployeeStore, Function>(
      converter: (store) {
        return (String? value) {
          store.dispatch({
            'type': EmployeeAction.textFilter,
            'value': value,
          });
        };
      },
      builder: (context, callback) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: TextField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                border: OutlineInputBorder(),
                hintText: 'Search by first or last name'),
            onChanged: (query) => callback(query),
          ),
        );
      },
    );
  }
}
