# mobile

Mini-catalogue — application Flutter (Android / iOS).

## Prérequis

- Flutter 3.47.3 (Dart 3.13.3) — SDK Dart requis : `^3.13.3`
- Xcode pour iOS, Android Studio / SDK Android pour Android

Vérifier que l'environnement est complet :

```bash
flutter doctor
```

## Installation

```bash
flutter pub get
```

Ce projet utilise la génération de code (Freezed). Après un `pub get`, après avoir
modifié un modèle annoté, ou après un changement de branche :

```bash
dart run build_runner build
```

Pour régénérer automatiquement à chaque sauvegarde pendant le développement :

```bash
dart run build_runner watch
```

En cas de fichiers générés incohérents, repartir de zéro :

```bash
dart run build_runner clean
dart run build_runner build
```

> Le flag `--delete-conflicting-outputs` a été supprimé dans build_runner 2.16 :
> l'écrasement des fichiers en conflit est désormais le comportement par défaut.

## Lancer l'application

```bash
flutter devices          # lister les appareils et émulateurs disponibles
flutter run              # lancer sur l'appareil par défaut
flutter run -d <device>  # cibler un appareil précis
```

Build de production :

```bash
flutter build apk        # Android
flutter build ios        # iOS
```

## Qualité

```bash
dart analyze             # analyse statique
flutter test             # tests unitaires et de widgets
dart format .            # formatage
```

> `flutter analyze` échoue tant que le projet se trouve sous un chemin contenant
> un caractère accentué (ici `Privé`) : le serveur d'analyse tronque son message
> LSP et lève une `FormatException`. Utiliser `dart analyze`, ou déplacer le
> projet sous un chemin sans accent.

## Dépannage

```bash
flutter clean            # vider build/ et .dart_tool/
flutter pub get
```

## Ressources

- [Documentation Flutter](https://docs.flutter.dev/)
- [Freezed](https://pub.dev/packages/freezed)
- [go_router](https://pub.dev/packages/go_router)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
