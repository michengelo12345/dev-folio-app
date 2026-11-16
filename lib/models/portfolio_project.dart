import 'package:material_ui/material_ui.dart';

class PortfolioProject {
  const PortfolioProject({
    required this.name,
    required this.description,
    required this.technologies,
    required this.category,
    required this.status,
    required this.icon,
    this.isFeatured = false,
    this.repositoryUrl,
  });

  final String name;
  final String description;
  final List<String> technologies;
  final String category;
  final String status;
  final IconData icon;
  final bool isFeatured;
  final String? repositoryUrl;
}
