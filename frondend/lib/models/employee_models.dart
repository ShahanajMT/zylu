class Employee {
  final String? id;
  final String name;
  final String position;
  final String department;
  final DateTime joiningDate;
  final bool isActive;
  final String email;
  final double salary;

  Employee({
    this.id,
    required this.name,
    required this.position,
    required this.department,
    required this.joiningDate,
    required this.isActive,
    required this.email,
    required this.salary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['_id'],
      name: json['name'],
      position: json['position'],
      department: json['department'],
      joiningDate: DateTime.parse(json['joiningDate']),
      isActive: json['isActive'],
      email: json['email'],
      salary: json['salary']?.toDouble() ?? 0.0,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'position': position,
  //     'department': department,
  //     'joiningDate': joiningDate.toIso8601String(),
  //     'isActive': isActive,
  //     'email': email,
  //     'salary': salary,
  //   };
  // }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'position': position,
      'department': department,
      'joiningDate': joiningDate.toIso8601String(),
      'isActive': isActive,
      'email': email,
      'salary': salary,
    };
  }


  // Method to check if employee has been with company for more than 5 years
  bool get isVeteranEmployee {
    final now = DateTime.now();
    final yearsWithCompany = now.difference(joiningDate).inDays / 365;
    return yearsWithCompany > 5 && isActive;
  }

  String get formattedJoiningDate {
    return '${joiningDate.day}/${joiningDate.month}/${joiningDate.year}';
  }

  int get yearsOfService {
    final now = DateTime.now();
    return now.difference(joiningDate).inDays ~/ 365;
  }
}