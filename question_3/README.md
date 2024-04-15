# Question 3 - Rick and Morty Characters Application

This is a Flutter application that allows users to explore characters from the Rick and Morty universe. It fetches character data from the [Rick and Morty API](https://rickandmortyapi.com/) and displays it in a user-friendly interface.

## Project Structure

- **main.dart:** Entry point of the application. It initializes the app and defines routes.
- **constants/endpoints.dart:** Defines the endpoints used.
- **ui/welcome/welcome.dart:** Welcome screen displayed when the app starts. Allows users to navigate to the character page.
- **ui/characters/characters.dart:** Character page that fetches and displays character data. Users can browse characters and navigate between pages.
- **providers/page_provider.dart:** Provider class for managing page state. Keeps track of current page, total pages, and other page-related information.
- **models/character_model.dart:** Model classes for representing character and location data.

## Dependencies

- [Flutter](https://flutter.dev/)
- [http](https://pub.dev/packages/http): HTTP client for making requests to the Rick and Morty API.
- [provider](https://pub.dev/packages/provider): State management library for managing app state.
- [material](https://api.flutter.dev/flutter/material/material-library.html): Material Design widgets for building UIs.