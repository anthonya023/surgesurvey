import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;

class LoadingUtils {
  static void show({String? status}) {
    EasyLoading.show(status: status ?? 'Loading...');
  }

  static void showProgress(double value, {String? status}) {
    EasyLoading.showProgress(value, status: status);
  }

  static void showSuccess(String status) {
    EasyLoading.showSuccess(status);
  }

  static void showError(String status) {
    EasyLoading.showError(status);
  }

  static void showInfo(String status) {
    EasyLoading.showInfo(status, duration: const Duration(milliseconds: 500));
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
