class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.contactFirstName,
    required this.contactLastName,
    required this.email,
  });

  final int id;
  final String companyName;
  final String contactFirstName;
  final String contactLastName;
  final String email;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        companyName: json["company_name"],
        contactFirstName: json["contact_first_name"],
        contactLastName: json["contact_last_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyName,
        "contact_first_name": contactFirstName,
        "contact_last_name": contactLastName,
        "email": email,
      };
}
