import 'package:material_ui/material_ui.dart';

import '../models/portfolio_project.dart';
import 'badge_overlay.dart';
import 'skill_chip.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    final Widget card = Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, project.isFeatured ? 48 : 18, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: scheme.primary.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(project.icon, color: scheme.primary, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        project.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        project.category,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: scheme.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            Text(
              project.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                height: 1.45,
                color: Colors.white.withValues(alpha: 0.76),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 2,
              children: project.technologies
                  .map((String skill) => SkillChip(label: skill))
                  .toList(),
            ),
            const SizedBox(height: 9),
            Row(
              children: <Widget>[
                Icon(Icons.circle, size: 8, color: scheme.secondary),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    project.status,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: Colors.white60),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    if (!project.isFeatured) {
      return card;
    }

    return BadgeOverlay(
      badgeText: 'EM DESTAQUE',
      badgeColor: const Color(0xFFFFC857),
      child: card,
    );
  }
}
