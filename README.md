# 🪙 CryptoSnap

A sleek, real-time cryptocurrency tracker app built using **Flutter**, **BLoC** for state management, and **REST API integration** via CoinGecko API. Perfect for learning advanced Flutter architecture while building a portfolio-ready project.

---

## ✨ Features

- 📈 Real-time crypto data (top 100 coins)
- 🔄 Pull-to-refresh mechanism
- 📊 Displays:
    - Coin name, symbol, and logo
    - Current price
    - 24h price change in %
- 💡 Built with clean BLoC architecture
- 🔌 REST API integration (CoinGecko)
- 📱 Modern and responsive UI

---

## 📦 Project Structure
lib/
├── bloc/ # BLoC files
│ ├── crypto_bloc.dart
│ ├── crypto_event.dart
│ └── crypto_state.dart
├── models/ # Data models
│ └── crypto_model.dart
├── repository/ # Data access logic
│ └── crypto_repository.dart
├── services/ # API calls
│ └── api_service.dart
├── ui/ # UI screens
│ ├── home_page.dart
│ └── detail_page.dart
└── main.dart # App entry point

---

## 🧠 Tech Stack

| Tool           | Purpose                         |
|----------------|----------------------------------|
| Flutter        | UI framework                    |
| BLoC           | State management                |
| HTTP package   | REST API integration            |
| CoinGecko API  | Real-time crypto price data     |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- A connected device or emulator
- Internet connection

### Run the app

```bash
git clone https://github.com/your-username/cryptosnap.git
cd cryptosnap
flutter pub get
flutter run

