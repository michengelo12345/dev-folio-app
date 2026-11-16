# DevFolio App

**Carteira e portfólio do desenvolvedor mobile** — aplicação Flutter responsiva para apresentar perfil, habilidades, projetos acadêmicos e métricas de desenvolvimento.

> **Personalização obrigatória antes da entrega:** substitua os dados de exemplo pelo nome, foto (se houver), habilidades e projetos efetivamente confirmados pelo grupo. Métricas não verificadas permanecem como `—`. Não publique placeholders como se fossem informações reais.

## 1. Funcionalidades

- Perfil/crachá com `CircleAvatar`, apresentação e cartão com `LinearGradient`.
- Habilidades técnicas organizadas com `Wrap` e chips reutilizáveis.
- Dashboard com `GridView.count`, indicadores e `Card` com elevação.
- Cartões de projetos com tecnologias, categoria e status.
- Selo de destaque usando `Stack` e `Positioned`.
- Navegação adaptativa: `NavigationBar` em larguras compactas e `NavigationRail` em telas amplas.
- Layouts responsivos com `LayoutBuilder`, `Expanded`, `Wrap` e rolagem vertical.
- Tema escuro centralizado em `ThemeData`/`CardThemeData`.
- Testes de widgets e workflow de integração contínua no GitHub Actions.

## 2. Tecnologias

- Flutter (canal stable; recomendado Flutter 3.35 ou superior).
- Dart 3.9 ou superior.
- Material Design 3.
- Flutter Test.

O projeto não utiliza dependências externas de runtime.

## 3. Estrutura

```text
devfolio_app/
├── .github/workflows/flutter-ci.yml
├── assets/images/                # fotografia opcional do perfil
├── docs/
│   ├── DEMO_DAY.md
│   └── ENTREGA_FINAL.md
├── lib/
│   ├── data/portfolio_data.dart
│   ├── main.dart
│   ├── models/portfolio_project.dart
│   ├── screens/
│   │   ├── dashboard_screen.dart
│   │   └── profile_screen.dart
│   ├── theme/app_theme.dart
│   └── widgets/
│       ├── badge_overlay.dart
│       ├── bloco_estatistica.dart
│       ├── profile_identity_card.dart
│       ├── project_card.dart
│       ├── section_title.dart
│       └── skill_chip.dart
├── screenshots/                  # capturas reais da execução
├── test/widget_test.dart
├── tool/validar_projeto.sh
├── web/                           # configuração Flutter Web
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

## 4. Personalização dos dados

Edite **somente a fonte centralizada** `lib/data/portfolio_data.dart` para atualizar:

1. `developerName`: nome real do integrante responsável pelo portfólio.
2. `professionalTitle`: identificação profissional adequada.
3. `initials`: iniciais exibidas quando não houver fotografia.
4. `biography`: apresentação pessoal verdadeira, sem experiências inventadas.
5. `skills`: apenas tecnologias que o aluno estudou ou utilizou.
6. `projects`: confirme descrição, tecnologias, categoria e status de cada projeto.
7. `publicRepositories` e `commits`: preencha apenas após verificar o GitHub. Enquanto isso, `null` exibe `—`.

### Fotografia de perfil

1. Copie uma imagem autorizada para `assets/images/profile.png`.
2. Em `pubspec.yaml`, adicione:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

3. Em `PortfolioData`, altere `profilePhotoAsset` para `assets/images/profile.png`.
4. Execute `flutter pub get` e valide novamente.

Se não houver imagem, o avatar com iniciais continuará funcionando. A fotografia real é uma personalização pendente, não uma imagem fictícia incluída no pacote.

## 5. Preparar o ambiente no servidor Debian

Entre na pasta do projeto:

```bash
cd ~/devfolio_app
flutter --version
dart --version
flutter doctor -v
flutter devices
```

Se o diretório `android/` não existir e o grupo também precisar do runner Android, gere somente essa plataforma com o Flutter instalado no servidor:

```bash
flutter create . --platforms=android
```

Faça backup antes. Não execute esse comando se o projeto já possuir uma pasta `android/` configurada sem antes comparar o que será alterado. A pasta `web/` já está incluída neste pacote.

## 6. Instalar, formatar e validar

```bash
flutter pub get
dart format .
flutter analyze
flutter test
flutter build web --release
```

Também é possível executar a sequência pelo script:

```bash
bash tool/validar_projeto.sh
```

O script interrompe no primeiro comando que falhar. Corrija o erro e repita a validação. Não considere o projeto validado apenas porque os arquivos existem.

### Executar no Web Preview

```bash
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Se a porta estiver ocupada:

```bash
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8081
```

Confirme a URL/porta exibida pelo servidor da sala e abra o Web Preview correspondente.

### Build Android opcional

Quando o SDK Android estiver configurado:

```bash
flutter build apk --release
```

O requisito de validação descrito na atividade deve ser conferido no Web Preview do servidor. O build Android é complementar.

## 7. Matriz de responsividade

O teste de widgets cobre estas dimensões de referência:

| Perfil | Resolução |
|---|---:|
| Smartphone compacto | 360 × 800 |
| Smartphone padrão | 412 × 917 |
| Tablet | 768 × 1024 |
| Desktop | 1280 × 720 |

Além dos testes automatizados, abra o Web Preview e percorra Perfil e Dashboard em cada largura. Confira texto, chips, cartões, navegação, selo, rolagem e console do navegador. Um teste de widget não substitui a inspeção visual real.

## 8. Screenshots

Depois de executar a versão final, salve capturas reais em `screenshots/`:

- `perfil-mobile.png`
- `dashboard-mobile.png`
- `perfil-desktop.png`
- `dashboard-desktop.png`

O pacote contém apenas instruções para essa pasta. Não foram incluídas capturas simuladas, porque ainda não houve execução do Flutter neste ambiente.

## 9. Git e publicação

Confira o estado antes de versionar:

```bash
git status --short --branch
git remote -v
git log --oneline -10
```

Após o professor/grupo validar o servidor:

```bash
git add .
git commit -m "feat: finalize responsive DevFolio portfolio"
git push origin main
```

Use o nome de branch remoto real do repositório se não for `main`. Não force push e não inclua tokens, senhas ou arquivos locais sensíveis. Commits devem representar mudanças realmente realizadas; não invente histórico retroativo.

## 10. Documentação para apresentação

- [`docs/DEMO_DAY.md`](docs/DEMO_DAY.md): roteiro de demonstração e explicação técnica.
- [`docs/ENTREGA_FINAL.md`](docs/ENTREGA_FINAL.md): sequência de fechamento e checklist de submissão.

## 11. Referências oficiais

- [Flutter Learning Pathway](https://docs.flutter.dev/learn/pathway)
- [Adaptive and responsive design](https://docs.flutter.dev/ui/adaptive-responsive)
- [Flutter API — ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
- [Flutter API — CardThemeData](https://api.flutter.dev/flutter/material/CardThemeData-class.html)
- [Flutter API — Color.withValues](https://api.flutter.dev/flutter/dart-ui/Color/withValues.html)

## 12. Autoria

Preencha com os nomes reais dos integrantes, turma e identificação solicitada pelo professor. Não deixe este campo genérico na entrega final.
