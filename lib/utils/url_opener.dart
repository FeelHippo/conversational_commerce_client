import 'package:fimber/fimber.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlOpener {
  factory UrlOpener() => instance ??= UrlOpener._internal();

  UrlOpener._internal();

  static UrlOpener? instance;

  Future<void> openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      Fimber.e('cant open link $url');
    }
  }
}
