import 'package:flutter/foundation.dart';

abstract class BaseController extends ChangeNotifier {
  bool isLoading = false;
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  void start() {}

  void stop() {}

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
