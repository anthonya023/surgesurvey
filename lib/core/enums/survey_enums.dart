enum SurveyStep {
  projectDetails,
  equipmentDetails,
  applicationSelection;

  int get stepNumber {
    switch (this) {
      case SurveyStep.projectDetails:
        return 1;
      case SurveyStep.equipmentDetails:
        return 2;
      case SurveyStep.applicationSelection:
        return 3;
    }
  }

  static SurveyStep fromStepNumber(int step) {
    switch (step) {
      case 1:
        return SurveyStep.projectDetails;
      case 2:
        return SurveyStep.equipmentDetails;
      case 3:
        return SurveyStep.applicationSelection;
      default:
        return SurveyStep.projectDetails;
    }
  }
}

enum ApplicationType {
  powerAtPanel,
  powerAtLoad,
  dataTelecom;

  String get displayName {
    switch (this) {
      case ApplicationType.powerAtPanel:
        return 'POWER@PANEL';
      case ApplicationType.powerAtLoad:
        return 'POWER@LOAD';
      case ApplicationType.dataTelecom:
        return 'DATA / TELECOM';
    }
  }

  static ApplicationType? fromDisplayName(String displayName) {
    for (final type in ApplicationType.values) {
      if (type.displayName == displayName) {
        return type;
      }
    }
    return null;
  }
}