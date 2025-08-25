import 'package:surgesurvey/utils/app_constants.dart';
import 'package:surgesurvey/utils/loading_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  static Future<void> launchURL(String url, {LaunchMode? mode}) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: mode ?? LaunchMode.platformDefault);
      } else {
        LoadingUtils.showError('Could not launch $url');
      }
    } catch (e) {
      LoadingUtils.showError('Failed to launch URL: $e');
    }
  }

  static Future<void> _launchPhoneCall({required String phoneNumber}) async {
    try {
      final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        LoadingUtils.showError('Could not launch $uri');
      }
    } catch (e) {
      LoadingUtils.showError('Failed to make phone call: $e');
    }
  }

  static Future<void> callSupport() async {
    await _launchPhoneCall(phoneNumber: AppConstants.supportPhoneNumber);
  }
}
