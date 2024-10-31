# Flutter Repository Explorer

A Flutter app that presents a curated list of "Flutter" repositories, sorted by star count, with seamless pagination and detailed repository information.

## Features

- **Repository List:** Displays a list of Flutter repositories sorted by the number of stars.
- **Pagination:** Automatically loads additional repositories in batches of 10 as you scroll down.
- **Detail Page:** Each repository card links to a detail page showing:
    - Owner information
    - Detailed description
    - Repository language
    - Visibility
    - Topics
    - Open issue count
    - Last update time

## Architecture

This app is built using the Clean Architecture principles to ensure separation of concerns and maintainability. The project structure consists of:

- **Presentation Layer:** UI components and state management using GetX.
- **Domain Layer:** Business logic and repository patterns.
- **Data Layer:** Data sources, including API calls to fetch repository information.

## Usage

1. Launch the app to see the list of Flutter repositories sorted by star count.
2. Scroll down to load more repositories automatically.
3. Click on a repository card to view detailed information on the repository detail page.

## State Management

This application utilizes GetX for state management, providing reactive programming capabilities, dependency injection, and route management.

## 
Thank you for checking out the Flutter Repository Explorer! Enjoy exploring the world of Flutter repositories!