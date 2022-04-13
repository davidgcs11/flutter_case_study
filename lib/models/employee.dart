class Employee {
  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
    required this.companyId,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  final int companyId;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        avatar: json["avatar"],
        companyId: json["company_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "avatar": avatar,
        "company_id": companyId,
      };
}
