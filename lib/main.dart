import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coco Pizza House',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[50],
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ==========================================
// 1. HOME PAGE
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coco Pizza House'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/previews/041/761/184/non_2x/italian-food-restaurant-or-cafeteria-illustration-with-traditional-italy-dishes-pizza-or-pasta-in-flat-cartoon-background-design-vector.jpg',
                  height: 180,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Coco Pizza House!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // 3 OutlinedButton Widgets
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(color: Colors.deepPurple, width: 2),
                  minimumSize: const Size(220, 45),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuPage()));
                },
                icon: const Icon(Icons.restaurant_menu),
                label: const Text('Menu'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(color: Colors.deepPurple, width: 2),
                  minimumSize: const Size(220, 45),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
                },
                icon: const Icon(Icons.info_outline),
                label: const Text('About'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(color: Colors.deepPurple, width: 2),
                  minimumSize: const Size(220, 45),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
                },
                icon: const Icon(Icons.contact_support),
                label: const Text('Contact Us'),
              ),
              const SizedBox(height: 30),

              // Twitter/X & Facebook Icons
              const Text('Follow us on our official social media:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.blue, size: 36),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: 'https://twitter.com',
                            title: 'Twitter / X Page',
                          ),
                        ),
                      );
                    },
                    tooltip: 'Twitter / X',
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.facebook, color: Colors.indigo, size: 36),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: 'https://facebook.com',
                            title: 'Facebook Page',
                          ),
                        ),
                      );
                    },
                    tooltip: 'Facebook',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. MENU PAGE
// ==========================================
class PizzaItem {
  final String name;
  final String price;
  final String imageUrl;

  PizzaItem({required this.name, required this.price, required this.imageUrl});
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PizzaItem> pizzas = [
      PizzaItem(
        name: 'Pepperoni Feast',
        price: 'RM 25.00',
        imageUrl: 'https://images.unsplash.com/photo-1628840042765-356cda07504e',
      ),
      PizzaItem(
        name: 'Hawaiian Chicken',
        price: 'RM 22.00',
        imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
      ),
      PizzaItem(
        name: 'Super Supreme Cheese',
        price: 'RM 30.00',
        imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Available'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Image.network(
                pizzas[index].imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(pizzas[index].name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Price: ${pizzas[index].price}', style: const TextStyle(color: Colors.deepPurple)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 3. ABOUT PAGE
// ==========================================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About Coco Pizza House',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            SizedBox(height: 15),
            Text(
              'Coco Restaurant is built with one passion in mind, which is to serve our customer with a lovely and welcoming soul food that reminds you the very best about the childhood. In every dish, we use fresh ingredients and prepare it using perfection in mind.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 15),
            Text(
              'The goal is to fill you stomach, release your tension while bringing back those childhood memories. Come see us!',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. CONTACT PAGE
// ==========================================
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '📞 Reach Us',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.deepPurple),
              title: Text('Address'),
              subtitle: Text('Kampung Pisang, Bintulu, Sarawak'),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.deepPurple),
              title: Text('Phone @ WhatsApp'),
              subtitle: Text('+60 17-808 4356'),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.deepPurple),
              title: Text('Email'),
              subtitle: Text('cocopizzahouse@crjf.com'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5 & 6. TWITTER/X & FACEBOOK WEBVIEW PAGE
// ==========================================
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