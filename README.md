# townsquare_by_alwanzaki

My first mini task for step 2 was on Celebreak using flutter with Riverpod (P.S. is this the most popular state management)

## Getting Started

- run flutter pub get
- run dart run build runner build --delete-conflicting-outputs
- run flutter run

## Project Structure
lib/ (Root directory)
├── app/
│   ├── router.dart
│   ├── router.g.dart
│   ├── routes.dart
│   ├── theme.dart
│   └── theme.g.dart
│
├── common/
│   ├── theme/
│   └── widget/
│
├── dashboard/
│   ├── data/
│   │   ├── models/
│   │   └── providers/
│   │
│   └── presentation/
│       ├── pages/
│       └── widgets/
│
├── app.dart
└── main.dart
This structure follows a clean architecture with the following divisions:

app/ - Application configuration (routing, theme)
common/ - Shared components and utilities
dashboard/ - Dashboard features with:

data/ - Data layer (models and providers)
presentation/ - UI layer (pages and widgets)

Main files:

app.dart - Application root widget
main.dart - Application entry point

This structure shows the use of:

Auto-generated files (.g.dart)
Feature-first architecture
Separation of concerns
Clean architecture principles

## What I Changes
- color and data on category list filters
- order of content on navbar and drawer
- the color of some content like time and duration
- etc...

## Website url
https://town-square-3720a.web.app
