import 'package:get_it/get_it.dart';
import 'package:surgesurvey/presentation/screen/new_survey/controller/controller.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  // Controllers
  getIt.registerFactory<NewSurveyController>(() => NewSurveyController());
}