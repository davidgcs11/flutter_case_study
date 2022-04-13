import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/company.dart';
import 'package:flutter_case_study/models/employee.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final Company? company;
  const EmployeeCard({Key? key, required this.employee, this.company})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blueGrey.shade50],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                width: 50,
                imageUrl: employee.avatar,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.supervised_user_circle,
                  size: 35,
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${employee.firstName}, ${employee.lastName}'),
                  Text(employee.email),
                ],
              ),
            ],
          ),
          if (company != null)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    company!.companyName,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
