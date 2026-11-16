
import 'package:flutter/material.dart';

import '../models/portfolio_project.dart';

class DeveloperProfile {
  const DeveloperProfile({
    required this.name,
    required this.initials,
    required this.professionalTitle,
    this.photoAsset,
  });

  final String name;
  final String initials;
  final String professionalTitle;
  final String? photoAsset;
}

class PortfolioData {
  PortfolioData._();

  static const List<DeveloperProfile> developers = <DeveloperProfile>[
    DeveloperProfile(
      name: 'Gaby',
      initials: 'G',
      professionalTitle: 'Desenvolvedora Mobile em formação',
      photoAsset: 'assets/images/gaby.jpg',
    ),
    DeveloperProfile(
      name: 'Guilherme Riquelme',
      initials: 'GR',
      professionalTitle: 'Desenvolvedor Mobile em formação',
      photoAsset: 'assets/images/guilherme_riquelme.jpg',
    ),
    DeveloperProfile(
      name: 'Michelangelo',
      initials: 'M',
      professionalTitle: 'Desenvolvedor Mobile em formação',
      photoAsset: 'assets/images/michelangelo.jpg',
    ),
  ];

  static const String biography =
      'Somos uma equipe de estudantes de desenvolvimento de software. '
      'Trabalhamos em conjunto na criação de aplicações organizadas, úteis '
      'e responsivas. Este portfólio reúne projetos acadêmicos e experiências '
      'práticas desenvolvidas pelo grupo.';

  static const List<String> skills = <String>[
    'Flutter',
    'Dart',
    'PHP',
    'MySQL',
    'Git',
    'GitHub',
  ];

  static const int? publicRepositories = null;
  static const int? commits = null;

  static const List<PortfolioProject> projects = <PortfolioProject>[
    PortfolioProject(
      name: 'YouFarm',
      description:
          'Aplicativo de gerenciamento agrícola, com foco na organização '
          'de recursos, produção e informações da fazenda.',
      technologies: <String>['Flutter', 'Dart', 'PHP', 'MySQL'],
      category: 'Projeto acadêmico',
      status: 'Em desenvolvimento',
      icon: Icons.agriculture_outlined,
      isFeatured: true,
    ),
    PortfolioProject(
      name: 'Dartpedia',
      description:
          'Aplicação de linha de comando desenvolvida em Dart, organizada '
          'em comandos e funcionalidades reutilizáveis.',
      technologies: <String>['Dart', 'CLI', 'Git'],
      category: 'Projeto acadêmico',
      status: 'Projeto de estudo',
      icon: Icons.terminal,
    ),
    PortfolioProject(
      name: 'Carrinho Provider',
      description:
          'Aplicação de estudo de gerenciamento de estado utilizando '
          'Provider e ChangeNotifier no Flutter.',
      technologies: <String>['Flutter', 'Dart', 'Provider'],
      category: 'Projeto acadêmico',
      status: 'Projeto de estudo',
      icon: Icons.shopping_cart_outlined,
    ),
  ];

  static String get repositoryCountLabel =>
      publicRepositories?.toString() ?? '—';

  static String get commitsLabel => commits?.toString() ?? '—';
}

