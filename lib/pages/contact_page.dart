import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Icon(Icons.local_pizza, size: 72, color: theme.colorScheme.primary),
          const SizedBox(height: 8),
          Text(
            'Jamali Pizzaria',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20),
          const _ContactTile(
            icon: Icons.phone,
            label: 'Phone',
            value: '0136376972',
          ),
          const _ContactTile(
            icon: Icons.email,
            label: 'Email',
            value: 'faridpizza@gmail.com',
          ),
          const _ContactTile(
            icon: Icons.location_on,
            label: 'Address',
            value:
                'Jalan Kampung Konoha 2, Kampung Daun Karat, 93050, '
                'Kuching, Sarawak',
          ),
          const _ContactTile(
            icon: Icons.access_time,
            label: 'Opening hours',
            value: 'Daily, 11:00 AM - 10:00 PM',
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(label),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
