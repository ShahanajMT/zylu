import 'package:flutter/foundation.dart';
import 'package:frondend/models/employee_models.dart';
import 'package:frondend/service/api_service.dart';


class EmployeeProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Employee> _employees = [];
  bool _isLoading = false;
  String _error = '';

  List<Employee> get employees => _employees;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Get employees who are veterans (more than 5 years and active)
  List<Employee> get veteranEmployees {
    return _employees.where((employee) => employee.isVeteranEmployee).toList();
  }

  Future<void> fetchEmployees() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _employees = await _apiService.getEmployees();
      _error = '';
    } catch (e) {
      _error = 'Failed to fetch employees: $e';
      _employees = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addEmployee(Employee employee) async {
    try {
      final newEmployee = await _apiService.createEmployee(employee);
      _employees.add(newEmployee);
      _error = '';
      notifyListeners();
    } catch (e) {
      _error = 'Failed to add employee: $e';
      notifyListeners();
      throw e;
    }
  }

  Future<void> updateEmployee(String id, Employee employee) async {
    try {
      final updatedEmployee = await _apiService.updateEmployee(id, employee);
      final index = _employees.indexWhere((emp) => emp.id == id);
      if (index != -1) {
        _employees[index] = updatedEmployee;
      }
      _error = '';
      notifyListeners();
    } catch (e) {
      _error = 'Failed to update employee: $e';
      notifyListeners();
      throw e;
    }
  }

  Future<void> deleteEmployee(String id) async {
    try {
      await _apiService.deleteEmployee(id);
      _employees.removeWhere((emp) => emp.id == id);
      _error = '';
      notifyListeners();
    } catch (e) {
      _error = 'Failed to delete employee: $e';
      notifyListeners();
      throw e;
    }
  }

  void clearError() {
    _error = '';
    notifyListeners();
  }
}