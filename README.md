# SciRes Discover
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/ahmedshaban-blip/scientific_research_discover)

SciRes Discover is a cross-platform application built with Flutter that allows users to search, discover, and read scientific research papers from the arXiv.org repository. It provides a simple and efficient interface for accessing a vast collection of academic articles across various fields.

## Features

- **User Authentication**: Secure sign-in and sign-up powered by Firebase Authentication.
- **Search Papers**: Search for research papers on arXiv using keywords.
- **Filter Results**: Apply filters to narrow down search results, such as by year of publication.
- **View Paper Details**: Access detailed information for each paper, including title, authors, and abstract.
- **Read Full Papers**: Directly open and read the PDF version of the research papers.
- **Clean UI**: A user-friendly and aesthetically pleasing interface for a smooth browsing experience.
- **Cross-Platform**: Built with Flutter, the app is compatible with Android, iOS, Web, and desktop platforms.

## Technology Stack

- **Framework**: Flutter
- **State Management**: Flutter BLoC (Cubit)
- **Backend & Authentication**: Google Firebase (Authentication, Firestore)
- **Data Source**: arXiv API
- **Core Libraries**:
  - `http` & `xml`: For making API requests and parsing the XML response from arXiv.
  - `url_launcher`: To open external links to research papers.
  - `firebase_ui_auth`: For a pre-built, customizable authentication UI.
  - `page_transition`: For smooth screen transitions.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- A code editor like VS Code or Android Studio.

### Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/ahmedshaban-blip/scientific_research_discover.git
    cd scientific_research_discover
    ```

2.  **Firebase Configuration:**
    This project uses Firebase for authentication. You will need to set up your own Firebase project.
    - Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.
    - Add an Android, iOS, and Web app to your Firebase project.
    - For Android, download the `google-services.json` file and place it in the `android/app/` directory.
    - For other platforms, run the FlutterFire CLI to configure your app:
      ```sh
      flutterfire configure
      ```
    - This will generate a `lib/firebase_options.dart` file with your project's credentials.

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Run the application:**
    ```sh
    flutter run
    ```

## Project Structure

The project follows a standard Flutter application structure, with code organized as follows:

```
lib/
├── Data/               # Data models (arxivmodel.dart) and API services (api.dart)
├── cubit/              # BLoC/Cubit files for state management
├── screens/            # UI widgets for different app screens
│   ├── Filters Screen.dart
│   ├── Research Detail Screen.dart
│   ├── Firist Screen/
│   │   └── ArxivPaperScreen.dart
│   └── home/
│       └── SignInScreen.dart
├── firebase_options.dart # Firebase configuration
└── main.dart           # Main application entry point
