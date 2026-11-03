import 'package:flutter/material.dart';

import 'web_view_page.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewPage(title: 'Twitter / X', url: 'https://x.com');
  }
}
