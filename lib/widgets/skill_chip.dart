import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({super.key, required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Chip(
      avatar: icon == null
          ? null
          : Icon(icon, size: 17, color: const Color(0xFFB9AEFF)),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: const Color(0xFF26334F),
      side: BorderSide(color: scheme.primary.withValues(alpha: 0.65)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      visualDensity: VisualDensity.compact,
    );
  }
}
