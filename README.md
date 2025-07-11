
A training e-commerce mobile application built with Flutter. This project was started as my first app two years ago to learn and practice mobile development. It is not intended for production use, but as a showcase of learning and experimentation.

## Screenshots

<img width="1280" height="720" alt="store app" src="https://github.com/user-attachments/assets/9bda183a-8746-4358-aced-d5d73667f82a" />

## Features

- User authentication (Sign up, Login, Google Sign-In, Forgot Password)
- Product catalog with categories
- Product details view
- Shopping cart management
- Favorites (wishlist) management
- User profile and information editing
- Multi-language support (localization: Arabic & English)
- Responsive UI with custom themes (Dark & Light mode)
- Internet connectivity status handling
- Modern UI components and animations

## Tech Stack

- **Flutter** (Dart)
- **Firebase** (Auth, Firestore, Storage)
- **BLoC** state management
- **Hive** for local storage
- **GoRouter** for navigation
- **ScreenUtil** for responsive design
- **Dark & Light Theme** support
- **Dio** for networking
- **Cached Network Image**, **Carousel Slider**, **Shimmer** for UI/UX

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd store_app
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

## Folder Structure

- `lib/feautres/start_app` — App start logic (onboarding, splash, etc.)
- `lib/feautres/theme` — Theme management (dark & light mode)
- `lib/l10n` — Localization resources (translations)
- `lib/feautres/auth` — Authentication (login, signup, profile, etc.)
- `lib/feautres/products` — Product catalog and details
- `lib/feautres/cart` — Shopping cart
- `lib/feautres/favorite` — Favorites (wishlist)
- `lib/feautres/localization` — Localization and language support
- `lib/core` — Core utilities and app setup

## Notes

- This project is for learning purposes only.
- The codebase may contain experimental or non-optimal solutions.
- Contributions and suggestions are welcome!

## Author

- This is my first mobile app project
