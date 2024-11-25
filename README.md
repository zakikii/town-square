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

![image](https://github.com/user-attachments/assets/353a6f9c-2f77-4e79-81d6-2cc2e28b4e09)

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

## What I Changes (my assumptions)
- color and data on category list filters, In the initial design, I think there were too many colors that actually had no meaning behind the coloring.
- order of content on navbar and drawer, i think the placement of content on the navbar should be like what I did.
- the color of some content like time and duration, this is like what i said in step 1, so i made the clock color and duration as time indicators.
- add draggable home page when scrolling down, this improves the ux quality.
  ![image](https://github.com/user-attachments/assets/250fa28a-9354-4667-b62b-00f0252dac56)
  ![image](https://github.com/user-attachments/assets/bd97be63-956f-40a4-bdcf-e8af3e50c00c)
- etc...

## What i'd improve with more time:
### User Experience Enhancements
- Implement pull-to-refresh functionality for updating activity listings
- Add smooth transitions when switching between category filters
- Include a "favorite activity" feature with persistent storage
- Add activity sharing capabilities with deep linking support
- Implement search functionality with auto-suggestions based on previous activities
###Visual Improvements
- Add skeleton loading animations while data is being fetched
- Implement custom animations for the category filter pills
- Create smoother transitions for the activity cards when filtering
- Add subtle hover/press states for interactive elements
- Implement progressive image loading for activity thumbnails
### Technical Enhancements
- Implement proper error boundary handling throughout the app
- Add comprehensive unit and widget tests for all components
- Implement proper caching strategy for activity data
- Add offline support with local storage
- Optimize performance with lazy loading and virtualized lists
### Additional Features
- Add a map view option to see activities by location
- Implement participant lists with avatars for each activity
- Add calendar integration for joined activities
- Create a waiting list feature for full activities
- Add activity recommendations based on user preferences
### Code Quality & Architecture
- Implement proper dependency injection
- Add comprehensive API error handling
- Improve state management with proper separation of concerns
- Add proper logging and analytics
- Implement proper localization support for multiple languages

#### These improvements would enhance both the user experience and technical robustness of the application while maintaining the clean, modern design shown in the screenshots. The focus would remain on making the activity discovery and joining process as smooth as possible while adding valuable features that align with the app's core functionality.

## Urls
- webapp : https://town-square-3720a.web.app
- video : https://drive.google.com/file/d/1-6wCxMbPRYPBwzk3Lf2f2hB20QOd1pL4/view?usp=drive_link

