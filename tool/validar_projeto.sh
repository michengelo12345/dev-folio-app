#!/usr/bin/env bash
set -Eeuo pipefail

printf '\n== DevFolio | validação local ==\n'
flutter --version
printf '\n[1/5] Instalando dependências...\n'
flutter pub get
printf '\n[2/5] Verificando formatação...\n'
dart format .
printf '\n[3/5] Análise estática...\n'
flutter analyze
printf '\n[4/5] Testes automatizados...\n'
flutter test
printf '\n[5/5] Build Web de produção...\n'
flutter build web --release
printf '\nValidação concluída sem erros reportados pelos comandos.\n'
