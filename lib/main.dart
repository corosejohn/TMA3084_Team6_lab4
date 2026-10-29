import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoran Lab 4.1',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 1. HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💜 Restoran Kita Lab 4.1'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang ke Restoran Lab 4.1!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuScreen()),
                  );
                },
                icon: const Icon(Icons.restaurant_menu),
                label: const Text('Lihat Menu Restoran'),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewScreen(
                        url: 'https://twitter.com',
                        title: 'Twitter / X',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.share),
                label: const Text('Buka Twitter / X WebView'),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewScreen(
                        url: 'https://facebook.com',
                        title: 'Facebook',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.facebook),
                label: const Text('Buka Facebook WebView'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. MENU SCREEN
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List> menuItems = [
      {
        'name': 'Wantan Sup',
        'price': 'RM 10.00',
        'desc': '8 pieces with chicken broth.',
      },
      {
        'name': 'Nasi Goreng Kampung',
        'price': 'RM 10.00',
        'desc': 'Spicy in moderation.',
      },
      {
        'name': 'Mee Kampua',
        'price': 'RM 6.00',
        'desc': 'Standard size.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Restoran'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.fastfood, size: 40, color: Colors.deepPurple),
              title: Text(
                menuItems[index]['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${menuItems[index]['desc']}\nHarga: ${menuItems[index]['price']}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

// 3. WEBVIEW SCREEN (Untuk Twitter/X & Facebook)
class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}