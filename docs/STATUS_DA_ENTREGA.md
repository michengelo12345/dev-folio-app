# Estado técnico do pacote — 16/11/2026

## Preparado neste pacote

- Código-fonte Flutter para Perfil e Dashboard.
- Componentes exigidos pelo enunciado: CircleAvatar, LinearGradient, Wrap/Chip, GridView.count, Card, Stack e Positioned.
- Navegação responsiva com NavigationBar/NavigationRail.
- Organização por screens, widgets, models, data e theme.
- Scaffold de Flutter Web, manifest e ícones.
- Testes de widgets para Perfil, Dashboard, navegação e quatro tamanhos de viewport.
- Script local de validação, CI do GitHub Actions, README e roteiro do Demo Day.

## Verificações executadas neste ambiente de preparação

- Estrutura de arquivos inspecionada.
- Imports relativos verificados por script: sem caminhos ausentes.
- Chamada antiga `package02/flutter/material.dart` não aparece no código final.
- Ocorrências de `withOpacity` substituídas por `withValues(alpha: ...)`.
- Manifesto JSON e imagens PNG incluídos no pacote.

## Verificações que NÃO foram executadas

O SDK Flutter/Dart não está instalado neste ambiente. Portanto, não foram executados:

- `flutter pub get`
- `dart format`
- `flutter analyze`
- `flutter test`
- `flutter build web --release`
- execução no Web Preview do servidor Debian

Também não foram executados push para GitHub nem envio ao Google Classroom, pois não há acesso à conta/repositório da equipe.

## Personalizações necessárias

- Nome, título, biografia e foto autorizada.
- Confirmar que cada projeto, tecnologia e status descritos representa o trabalho real do grupo.
- Preencher métricas somente com números verificados.
- Gerar screenshots no navegador após executar a versão final.
- Preencher autoria e turma no README.

**Conclusão:** o pacote é uma base de entrega preparada e documentada; não deve ser rotulado como build/testado/publicado até que as verificações pendentes sejam realizadas no servidor oficial.
