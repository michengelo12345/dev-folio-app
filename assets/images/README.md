# Fotos dos desenvolvedores

Adicione nesta pasta as fotos autorizadas dos três integrantes, usando estes nomes:

- `gaby.jpg`
- `guilherme_riquelme.jpg`
- `michelangelo.jpg`

Depois, abra `lib/data/portfolio_data.dart` e informe o caminho correspondente
no campo `photoAsset` de cada integrante. Exemplo: `photoAsset: 'assets/images/gaby.jpg'`.

A pasta `assets/images/` já está declarada no `pubspec.yaml`. Se usar PNG ou outro
formato, mantenha o nome do arquivo e o caminho em `photoAsset` iguais.
Enquanto `photoAsset` estiver como `null`, o cartão exibirá as iniciais do integrante.
