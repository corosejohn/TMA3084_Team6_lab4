import 'package:flutter/material.dart';

import '../routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/hero.png',
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                child: Column(
                  children: [
                    Text(
                      'Jamali Pizzaria',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fresh dough. Real cheese. Baked to order.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 28),
                    const _HomeButton(
                      label: 'Menu',
                      icon: Icons.local_pizza,
                      route: AppRoutes.menu,
                    ),
                    const SizedBox(height: 14),
                    const _HomeButton(
                      label: 'About Us',
                      icon: Icons.storefront,
                      route: AppRoutes.about,
                    ),
                    const SizedBox(height: 14),
                    const _HomeButton(
                      label: 'Contact Us',
                      icon: Icons.phone,
                      route: AppRoutes.contact,
                    ),
                    const SizedBox(height: 32),
                    Text('Follow us', style: theme.textTheme.labelLarge),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialButton(
                          tooltip: 'Twitter / X',
                          asset: 'assets/images/x_icon.png',
                          route: AppRoutes.twitter,
                        ),
                        SizedBox(width: 20),
                        _SocialButton(
                          tooltip: 'Facebook',
                          asset: 'assets/images/facebook_icon.png',
                          route: AppRoutes.facebook,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.tooltip,
    required this.asset,
    required this.route,
  });

  final String tooltip;
  final String asset;
  final String route;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      padding: EdgeInsets.zero,
      iconSize: 52,
      icon: Image.asset(asset, width: 52, height: 52),
      onPressed: () => Navigator.pushNamed(context, route),
    );
  }
}
