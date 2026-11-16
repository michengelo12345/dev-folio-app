import 'package:devfolio_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('inicia no perfil e apresenta as habilidades', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DevFolioApp());

    expect(find.text('Nosso time'), findsOneWidget);
    expect(find.text('Gaby'), findsOneWidget);
    expect(find.text('Guilherme Riquelme'), findsOneWidget);
    expect(find.text('Michelangelo'), findsOneWidget);
    expect(find.text('Habilidades técnicas da equipe'), findsOneWidget);
    expect(find.text('Flutter'), findsWidgets);
    expect(find.byType(CircleAvatar), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('navega para o dashboard e apresenta métricas e projetos', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DevFolioApp());

    await tester.tap(find.text('Dashboard').last);
    await tester.pumpAndSettle();

    expect(find.text('Visão geral'), findsOneWidget);
    expect(find.text('Projetos do portfólio'), findsOneWidget);
    expect(find.text('YouFarm'), findsOneWidget);
    expect(find.text('Dartpedia'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('usa NavigationRail em uma largura de desktop', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 720);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DevFolioApp());

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('mantém o perfil e o dashboard sem exceções nas viewports-alvo', (
    WidgetTester tester,
  ) async {
    const List<Size> viewports = <Size>[
      Size(360, 800),
      Size(412, 917),
      Size(768, 1024),
      Size(1280, 720),
    ];

    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    for (final Size viewport in viewports) {
      tester.view.physicalSize = viewport;
      await tester.pumpWidget(
        DevFolioApp(key: ValueKey<String>('viewport-${viewport.width}')),
      );
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: 'O perfil apresentou uma exceção em $viewport.',
      );

      final Finder dashboardDestination = find.text('Dashboard').last;
      await tester.tap(dashboardDestination);
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: 'O dashboard apresentou uma exceção em $viewport.',
      );
    }
  });
}
