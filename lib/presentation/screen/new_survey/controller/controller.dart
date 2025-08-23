import 'package:flutter/material.dart';
import 'package:surgesurvey/core/controller/base_controller.dart';
import 'package:surgesurvey/core/enums/survey_enums.dart';

class NewSurveyController extends BaseController {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController addressNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController panelIdController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String _projectName = '';
  String get projectName => _projectName;

  String _addressName = '';
  String get addressName => _addressName;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  SurveyStep _currentStep = SurveyStep.projectDetails;
  SurveyStep get currentStep => _currentStep;

  String _location = '';
  String get location => _location;

  String _panelId = '';
  String get panelId => _panelId;

  int _quantity = 1;
  int get quantity => _quantity;

  String? _selectedPhotoPath;
  String? get selectedPhotoPath => _selectedPhotoPath;

  ApplicationType? _selectedApplication;
  ApplicationType? get selectedApplication => _selectedApplication;

  void updateProjectName(String value) {
    _projectName = value;
    notifyListeners();
  }

  void updateAddressName(String value) {
    _addressName = value;
    notifyListeners();
  }

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void updateLocation(String value) {
    _location = value;
    notifyListeners();
  }

  void updatePanelId(String value) {
    _panelId = value;
    notifyListeners();
  }

  void updateQuantity(int value) {
    _quantity = value;
    quantityController.text = value.toString();
    notifyListeners();
  }

  void nextStep() {
    switch (_currentStep) {
      case SurveyStep.projectDetails:
        _currentStep = SurveyStep.equipmentDetails;
        break;
      case SurveyStep.equipmentDetails:
        _currentStep = SurveyStep.applicationSelection;
        break;
      case SurveyStep.applicationSelection:
        // Stay on last step
        break;
    }
    notifyListeners();
  }

  void previousStep() {
    switch (_currentStep) {
      case SurveyStep.projectDetails:
        // Stay on first step
        break;
      case SurveyStep.equipmentDetails:
        _currentStep = SurveyStep.projectDetails;
        break;
      case SurveyStep.applicationSelection:
        _currentStep = SurveyStep.equipmentDetails;
        break;
    }
    notifyListeners();
  }

  Future<void> pickPhoto() async {
    // TODO: Implement image picker
    _selectedPhotoPath = 'photo_selected.jpg'; // Placeholder
    notifyListeners();
  }

  void selectApplication(ApplicationType application) {
    _selectedApplication = application;
    notifyListeners();
  }

  Future<void> createSurvey() async {
    showLoading();
    try {
      // Survey creation logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      // Handle success
    } catch (e) {
      // Handle error
    } finally {
      hideLoading();
    }
  }

  @override
  void dispose() {
    projectNameController.dispose();
    addressNameController.dispose();
    dateController.dispose();
    locationController.dispose();
    panelIdController.dispose();
    quantityController.dispose();
    super.dispose();
  }
}
