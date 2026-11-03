import 'package:flutter/material.dart';

import 'web_view_page.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewPage(
      title: 'Facebook',
      url: 'https://www.facebook.com',
    );
  }
}
