# Fruits App 🍎 | Freshness at Your Doorstep

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Supported-orange?logo=firebase)](https://firebase.google.com)
[![Architecture](https://img.shields.io/badge/Architecture-Clean-green)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![State Management](https://img.shields.io/badge/State--Management-Bloc/Cubit-red)](https://bloclibrary.dev)

A feature-rich Flutter application that allows users to favorite fruits, place orders, and enjoy a responsive design in both portrait and landscape modes. Built with **Flutter BLoC**, **Dio**, and **Firebase Notifications** for seamless user experience.

---

## 📸 Full App Showcase

### 🌟 Splash & Onboarding

|                         Splash                         |                         Onboarding                          |                        Welcome                         |
| :----------------------------------------------------: | :---------------------------------------------------------: | :----------------------------------------------------: |
| <img src="assets/screenshoots/splash.png" width="250"> | <img src="assets/screenshoots/onboarding1.png" width="250"> | <img src="assets/screenshoots/welcom.png" width="250"> |

### 🔑 Authentication Flow

|                         Login                          |                        Sign Up                         |                       Forget Password                       |
| :----------------------------------------------------: | :----------------------------------------------------: | :---------------------------------------------------------: |
| <img src="assets/screenshoots/signIN.png" width="250"> | <img src="assets/screenshoots/SignUp.png" width="250"> | <img src="assets/screenshoots/forgetPassw.png" width="250"> |

### 🏠 Home & Discovery

|                         Home                         |                     Product Listing                      |                         Filter Search                         |
| :--------------------------------------------------: | :------------------------------------------------------: | :-----------------------------------------------------------: |
| <img src="assets/screenshoots/home.png" width="250"> | <img src="assets/screenshoots/products.png" width="250"> | <img src="assets/screenshoots/filter_dialog.png" width="250"> |

### 🍎 Product Details & Favorites

|                         Details View 1                          |                          Details View 2                          |                      Favorites                      |
| :-------------------------------------------------------------: | :--------------------------------------------------------------: | :-------------------------------------------------: |
| <img src="assets/screenshoots/product_details.png" width="250"> | <img src="assets/screenshoots/product_details2.png" width="250"> | <img src="assets/screenshoots/fav.png" width="250"> |

### 🛒 Shopping Basket

|                     Cart Overview                      |                     Multi-item Cart                     |
| :----------------------------------------------------: | :-----------------------------------------------------: |
| <img src="assets/screenshoots/basket.png" width="250"> | <img src="assets/screenshoots/basket2.png" width="250"> |

### 💳 Multi-step Checkout

|                      Step 1: Address                      |                     Step 2: Shipping                      |                      Step 3: Payment                      |
| :-------------------------------------------------------: | :-------------------------------------------------------: | :-------------------------------------------------------: |
| <img src="assets/screenshoots/checkout1.png" width="250"> | <img src="assets/screenshoots/checkout2.png" width="250"> | <img src="assets/screenshoots/checkout3.png" width="250"> |

|                      Step 4: Summary                      |                      Step 5: Review                       |                      Confirmation                       |
| :-------------------------------------------------------: | :-------------------------------------------------------: | :-----------------------------------------------------: |
| <img src="assets/screenshoots/checkout4.png" width="250"> | <img src="assets/screenshoots/checkout5.png" width="250"> | <img src="assets/screenshoots/confirm.png" width="250"> |

### 📦 Orders & Tracking

|                       My Orders                        |                         Order Tracking                         |
| :----------------------------------------------------: | :------------------------------------------------------------: |
| <img src="assets/screenshoots/orders.png" width="250"> | <img src="assets/screenshoots/order_tracking.png" width="250"> |

### 👤 Profile & User Settings

|                         Profile                         |                         Edit Profile                         |                         Language                         |
| :-----------------------------------------------------: | :----------------------------------------------------------: | :------------------------------------------------------: |
| <img src="assets/screenshoots/profile.png" width="250"> | <img src="assets/screenshoots/edit_profile.png" width="250"> | <img src="assets/screenshoots/language.png" width="250"> |

### ℹ️ Miscellaneous

|                  Terms & Conditions                   |                         Contact Us                         |
| :---------------------------------------------------: | :--------------------------------------------------------: |
| <img src="assets/screenshoots/terms.png" width="250"> | <img src="assets/screenshoots/contact_us.png" width="250"> |

---

## ✨ Features

- ⭐ **Favorite Fruits** – Users can mark their favorite fruits for quick access.
- 🛒 **Place Orders** – Smooth ordering experience for fresh fruit delivery.
- 💳 **Secure Payments** – Integrated with **Stripe** for safe and seamless transactions.
- 📍 **Order Tracking** – Real-time tracking of orders with a dedicated tracking screen.
- 📱 **Responsive UI** – Optimized for all screen sizes using `flutter_screenutil`.
- 🔄 **Portrait & Landscape Modes** – Flexible layout adaptation.
- 🔔 **Notifications** – Firebase & OneSignal push notifications for order updates.

---

## 🛠️ Technologies Used

- **Flutter ScreenUtil** – Responsive design handling.
- **Dio** – API integration for fetching fruit details and order processing.
- **Stripe SDK** – Secure payment processing integration.
- **Flutter BLoC** – State management.
- **Firebase Notifications** – Real-time notifications.
- **OneSignal** – Push notifications support.
- **Local Notifications** – Custom alerts and updates.
- **Get It** – Dependency injection.
- **Clean Architecture** – Scalable and maintainable code structure.

---

## 🏗️ Architecture Insight

The project strictly adheres to **Clean Architecture**, segregating the codebase into three independent layers:

```mermaid
graph TD
    UI[Presentation Layer: Screens/Widgets] --> Cubit[State Management: BlOC/Cubit]
    Cubit --> UseCases[Domain Layer: Use Cases]
    UseCases --> RepositoryInterface[Domain Layer: Repository Interface]
    RepositoryInterface -.-> RepositoryImpl[Data Layer: Repository Implementation]
    RepositoryImpl --> DataSource[Data Layer: Data Sources]
    DataSource --> API((Remote API / Local DB))
```

---

## 📁 Project Structure

```text
lib/
├── core/               # Deep-rooted utils, widgets, and services
│   ├── network/        # Dio configurations
│   ├── style/          # Colors, Fonts, Themes
│   └── utils/          # Constants and mapping
├── features/           # Feature-based modularization
│   ├── auth/           # Login, Register, Forgot Password
│   ├── home/           # Dashboard and Fruit Discovery
│   ├── basket/         # Shopping cart logic
│   ├── checkout/       # Multi-step order process
│   └── ...             # Profile, Orders, Favorites
└── main.dart           # Application entry point
```

---

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK `^3.x`
- Google Firebase Account (for notifications)

### Installation

1.  **Clone the Repo**
    ```bash
    git clone https://github.com/hamed12232/fruits_app.git
    ```
2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```
3.  **Run Application**
    ```bash
    flutter run
    ```

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

<p align="center">
  <i>Developed with precision and ❤️ by human & AI</i>
</p>
