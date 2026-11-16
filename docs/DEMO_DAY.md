# Roteiro do Demo Day — DevFolio App

Duração sugerida: 4 a 6 minutos. O apresentador deve demonstrar a aplicação em execução, não apenas ler o código.

## 1. Abertura (20–30 s)

"Este é o DevFolio App, uma carteira digital e portfólio desenvolvido em Flutter. O objetivo é reunir o perfil do desenvolvedor, suas habilidades, projetos e métricas em uma interface responsiva."

## 2. Perfil e crachá (45–60 s)

- Mostrar o avatar e a identificação.
- Explicar o `CircleAvatar` e o cartão com `LinearGradient`.
- Apresentar a seção de habilidades com `Wrap` e o componente reutilizável `SkillChip`.
- Explicar como os dados são centralizados em `lib/data/portfolio_data.dart`.

## 3. Dashboard (60–90 s)

- Navegar para Dashboard.
- Mostrar a grade implementada com `GridView.count`.
- Explicar os cartões `Card` e a elevação visual configurada no tema.
- Apresentar os valores reais que foram confirmados. Métricas não verificadas devem permanecer como indisponíveis, sem estimativas.

## 4. Projetos e sobreposição (45–60 s)

- Apresentar os cartões dos projetos.
- Mostrar o selo de destaque.
- Explicar que `Stack` organiza camadas e `Positioned` posiciona o selo dentro do cartão.
- Demonstrar os componentes reutilizáveis em `lib/widgets/`.

## 5. Responsividade (45–60 s)

- Alternar entre uma largura de smartphone e uma largura de desktop.
- Mostrar `NavigationBar` no layout compacto e `NavigationRail` no layout amplo.
- Explicar a adaptação com `LayoutBuilder`, `Expanded`, `Wrap` e rolagem.

## 6. Qualidade e encerramento (30–45 s)

- Mostrar a estrutura dos arquivos.
- Apresentar os resultados reais de `flutter analyze`, `flutter test` e `flutter build web --release`.
- Mostrar o README, screenshots reais e repositório GitHub.
- Encerrar explicando o que foi aprendido sobre layouts, componentização e responsividade.

## Perguntas técnicas que o grupo deve saber responder

**Por que separar widgets?** Para reduzir duplicação, deixar responsabilidades claras e facilitar manutenção.

**Por que usar `GridView.count`?** Para organizar os indicadores em uma grade com número de colunas definido conforme o espaço disponível.

**Qual a diferença entre `Row` e `Column`?** `Row` organiza filhos no eixo horizontal; `Column`, no vertical.

**Para que servem `Expanded` e `Flexible`?** Para distribuir ou limitar o espaço disponível entre filhos de layouts flexíveis.

**Para que servem `Stack` e `Positioned`?** Para sobrepor widgets e posicionar elementos dentro da área do Stack.

**Como foi tratado o overflow?** Com adaptação às restrições, `Wrap`, rolagem, limites de texto e testes em diferentes viewports. Só afirmem que não há overflow depois da validação visual e automatizada.

**O que é `ThemeData`?** A configuração central do tema visual, permitindo manter cores, tipografia e estilos consistentes.
