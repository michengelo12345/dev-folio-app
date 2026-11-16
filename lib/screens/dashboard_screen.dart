import 'package:material_ui/material_ui.dart';

import '../data/portfolio_data.dart';
import '../widgets/bloco_estatistica.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double availableWidth = constraints.maxWidth;
        final int columns = availableWidth >= 1100
            ? 4
            : availableWidth >= 700
            ? 3
            : 2;
        final double aspectRatio = availableWidth < 480 ? 0.90 : 1.28;

        final List<_Metric> metrics = <_Metric>[
          _Metric(
            title: 'Projetos cadastrados',
            value: PortfolioData.projects.length.toString().padLeft(2, '0'),
            icon: Icons.folder_copy_outlined,
            color: const Color(0xFF8B7CFF),
          ),
          _Metric(
            title: 'Habilidades',
            value: PortfolioData.skills.length.toString().padLeft(2, '0'),
            icon: Icons.code,
            color: const Color(0xFF35D6A2),
          ),
          _Metric(
            title: 'Repositórios públicos',
            value: PortfolioData.repositoryCountLabel,
            icon: Icons.source_outlined,
            color: const Color(0xFFFFC857),
            description: 'não informado',
          ),
          _Metric(
            title: 'Commits registrados',
            value: PortfolioData.commitsLabel,
            icon: Icons.commit,
            color: const Color(0xFFFF83B5),
            description: 'não informado',
          ),
        ];

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SectionTitle(
                    title: 'Visão geral',
                    subtitle:
                        'Resumo das atividades e dos projetos do portfólio.',
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: columns,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: aspectRatio,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: metrics
                        .map(
                          (_Metric metric) => BlocoEstatistica(
                            titulo: metric.title,
                            valor: metric.value,
                            icone: metric.icon,
                            corIcone: metric.color,
                            descricao: metric.description,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 28),
                  const SectionTitle(
                    title: 'Projetos do portfólio',
                    subtitle: 'Trabalhos acadêmicos e experiências práticas.',
                  ),
                  const SizedBox(height: 14),
                  ...PortfolioData.projects.map(
                    (project) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: ProjectCard(project: project),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const _DataDisclaimer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Metric {
  const _Metric({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.description,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? description;
}

class _DataDisclaimer extends StatelessWidget {
  const _DataDisclaimer();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Os dados de projetos e habilidades são editáveis em '
      'lib/data/portfolio_data.dart. '
      'Métricas não informadas aparecem como “—”.',
      style: Theme.of(
        context,
      ).textTheme.labelSmall?.copyWith(color: Colors.white54, height: 1.5),
    );
  }
}
