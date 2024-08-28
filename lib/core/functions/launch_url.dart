import 'package:url_launcher/url_launcher.dart';

import 'custom_snake_bar.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      snakeBar(context, url);
    }
  }
}
