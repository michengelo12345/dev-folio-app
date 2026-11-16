import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DevFolioApp());
}

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const DevFolioShell(),
    );
  }
}

class DevFolioShell extends StatefulWidget {
  const DevFolioShell({super.key});

  @override
  State<DevFolioShell> createState() => _DevFolioShellState();
}

class _DevFolioShellState extends State<DevFolioShell> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    ProfileScreen(),
    DashboardScreen(),
  ];

  static const List<String> _titles = <String>[
    'Perfil do desenvolvedor',
    'Projetos e métricas',
  ];

  void _selectScreen(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final bool useRail = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(child: _HeaderTag()),
          ),
        ],
      ),
      body: Row(
        children: <Widget>[
          if (useRail) ...<Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _selectScreen,
              labelType: NavigationRailLabelType.all,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.badge_outlined),
                  selectedIcon: Icon(Icons.badge),
                  label: Text('Perfil'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
              ],
            ),
            const VerticalDivider(width: 1, thickness: 1),
          ],
          Expanded(
            child: IndexedStack(index: _selectedIndex, children: _screens),
          ),
        ],
      ),
      bottomNavigationBar: useRail
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _selectScreen,
              destinations: const <NavigationDestination>[
                NavigationDestination(
                  icon: Icon(Icons.badge_outlined),
                  selectedIcon: Icon(Icons.badge),
                  label: 'Perfil',
                ),
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
              ],
            ),
    );
  }
}

class _HeaderTag extends StatelessWidget {
  const _HeaderTag();

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: primary.withValues(alpha: 0.35)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          'PORTFÓLIO',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
