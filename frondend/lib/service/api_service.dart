import 'dart:convert';
import 'package:frondend/models/employee_models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';

  Future<List<Employee>> getEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/employees'));
    
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Employee> employees = body.map((dynamic item) => Employee.fromJson(item)).toList();
      return employees;
    } else {
      throw Exception('Failed to load employees');
    }
  }

  // Future<Employee> createEmployee(Employee employee) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/employees'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(employee.toJson()),
  //   );

  //   if (response.statusCode == 201) {
  //     return Employee.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create employee');
  //   }
  // }

  Future<Employee> createEmployee(Employee employee) async {
  final response = await http.post(
    Uri.parse('$baseUrl/employees'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(employee.toJson()),
  );

  if (response.statusCode == 201) {
    return Employee.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create employee. Status code: ${response.statusCode}');
  }
}

  Future<Employee> updateEmployee(String id, Employee employee) async {
    final response = await http.put(
      Uri.parse('$baseUrl/employees/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(employee.toJson()),
    );

    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> deleteEmployee(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/employees/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}