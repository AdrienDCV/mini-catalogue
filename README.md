# Compilation et développement d'applications mobiles

---
DA COSTA VEIGA Adrien  
DESERT Lorick  

FISA 5A ICy  
INSA Hauts-de-France
--- 
# Mini-catalogue

## Fonctionnalités

| Exigence de l'énoncé | Réalisation |
|---|---|
| Afficher plusieurs fiches produits | `ProductListView` + `ProductCard`, catalogue chargé depuis `lib/data/sample_products.dart` |
| Proposer un affichage compact ou détaillé | Bouton « Afficher / Masquer les descriptions » — bascule globale sur toutes les fiches |
| Ajouter et retirer des favoris | Icône cœur sur chaque fiche (`FavouriteButton`) |
| Afficher automatiquement le nombre de favoris | Compteur dans le libellé du filtre, recalculé à chaque changement d'état |
| Filtrer le catalogue sur les favoris | Chip « Favoris (n) » |

Conformément à l'énoncé, les données ne sont pas persistantes : le catalogue est
reconstruit à chaque démarrage et les favoris sont perdus à la fermeture.

## Architecture

```
lib/
├── data/      source de données (catalogue de démonstration)
├── models/    ProductData — modèle immuable généré par Freezed
├── screens/   HomePage — écran unique
├── stores/    AppState (données) + AppStore (Cubit, logique)
└── widgets/   ProductCard, ProductListView, FavouriteButton
```

## Démarche : développement augmenté

L'usage d'une IA générative n'était pas interdit. Nous avons choisi de nous en
servir comme d'un binôme de développement, et non comme d'un générateur de code
à recopier. Concrètement :

- **La conception a été décidée par nous, pas par l'assistant.** Le choix de
  stocker les favoris sous forme d'un drapeau sur le produit, celui de garder
  `AppState` dépourvu de logique, celui d'un fichier par widget : chacun a été
  tranché par nous, parfois contre la recommandation de l'assistant, après avoir
  demandé et discuté ses arguments.
- **Chaque proposition a été relue et souvent refusée.** Plusieurs générations
  ont été annulées pour cause de périmètre dépassé, de code inutile, ou de
  résultat visuel insatisfaisant. Le code livré est le produit de ces
  allers-retours, pas d'une première sortie acceptée telle quelle.
- **Les explications ont été demandées systématiquement.** Pourquoi Freezed
  impose `abstract class` depuis la version 3, pourquoi muter une liste en place
  n'entraîne aucun rafraîchissement avec `Cubit.emit`, pourquoi un modèle
  immuable oblige à reconstruire la liste plutôt qu'à modifier un élément :
  autant de points élucidés en cours de route plutôt que subis.

Ce README, la structure du projet et l'ensemble des décisions d'architecture
sont donc assumés et explicables par leurs auteurs.

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

## Dépannage

```bash
flutter clean            # vider build/ et .dart_tool/
flutter pub get
```

## Ressources

- [Documentation Flutter](https://docs.flutter.dev/)
- [Freezed](https://pub.dev/packages/freezed)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
