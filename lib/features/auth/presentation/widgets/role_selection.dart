import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoleSelection extends ConsumerWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text(
          'Select your role:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _RoleButton(
              icon: Icons.home_work,
              label: 'Landlord/Seller',
              onPressed: () {
                // TODO: Handle landlord role selection
              },
            ),
            const SizedBox(width: 20),
            _RoleButton(
              icon: Icons.person,
              label: 'Tenant/Buyer',
              onPressed: () {
                // TODO: Handle tenant role selection
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _RoleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _RoleButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
