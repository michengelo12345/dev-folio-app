import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/profile_identity_card.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SectionTitle(
                title: 'Nosso time',
                subtitle:
                    'Três desenvolvedores trabalhando juntos nos mesmos projetos.',
              ),
              const SizedBox(height: 14),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final int columns = constraints.maxWidth >= 900
                      ? 3
                      : constraints.maxWidth >= 560
                      ? 2
                      : 1;
                  const double spacing = 16;
                  final double cardWidth = columns == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (spacing * (columns - 1))) /
                            columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: PortfolioData.developers
                        .map(
                          (DeveloperProfile developer) => SizedBox(
                            width: cardWidth,
                            child: ProfileIdentityCard(developer: developer),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 28),
              const SectionTitle(
                title: 'Sobre o time',
                subtitle:
                    'Um pouco da nossa trajetória e dos nossos interesses.',
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    PortfolioData.biography,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      color: Colors.white.withValues(alpha: 0.88),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              const SectionTitle(
                title: 'Habilidades técnicas da equipe',
                subtitle: 'Tecnologias e ferramentas estudadas e praticadas.',
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: PortfolioData.skills
                        .map((String skill) => SkillChip(label: skill))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const _ProfileNote(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileNote extends StatelessWidget {
  const _ProfileNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.info_outline, size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Para adicionar as fotos, coloque os arquivos em assets/images/ '
              'e informe cada caminho em lib/data/portfolio_data.dart.',
              style: TextStyle(fontSize: 12, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
