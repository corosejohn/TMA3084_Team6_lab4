import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/hero.png',
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Welcome to Jamali Pizzaria',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Jamali Pizzaria is built around one simple idea: honest pizza, '
            'made fresh. We stretch our dough by hand every day, simmer our '
            'own tomato sauce, and bake every pizza to order.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 12),
          const Text(
            'From the sweet-and-smoky Hawaiian to our house favourite, the '
            'Secret Mushroom Pizza, every recipe is made to be shared with '
            'family and friends.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),
          const _Highlight(
            icon: Icons.bakery_dining,
            title: 'Fresh dough daily',
            text: 'Made in-house every morning.',
          ),
          const _Highlight(
            icon: Icons.eco,
            title: 'Quality toppings',
            text: 'Real cheese and carefully chosen ingredients.',
          ),
          const _Highlight(
            icon: Icons.local_fire_department,
            title: 'Baked to order',
            text: 'Hot, golden and ready when you are.',
          ),
        ],
      ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          foregroundColor: Colors.white,
          child: Icon(icon),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(text),
      ),
    );
  }
}
