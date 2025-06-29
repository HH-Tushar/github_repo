# 🔍 Flutter GitHub Repository Search App

A Flutter application that allows users to search and browse the **top 50 most starred Flutter repositories** from GitHub, with support for **offline access**, **sorting**, **repository details**, **theme switching**, and **environment-based configurations (App Flavors)**.

---

## 📱 Features

### ✅ Core Functionalities

- 🔎 **Search Repositories**  
  Automatically fetches repositories from GitHub using the query keyword `Flutter`.

- ⭐ **Top 50 Most Starred Repositories**  
  Displays the top 50 repositories sorted by star count.

- 🔃 **Sorting Functionality**  
  - Sort by star count or last updated time  
  - Sorting option persists across app sessions

- 📂 **Repository Details Page**  
  Tap any item to view details:
  - Owner’s name and profile photo  
  - Description  
  - Last updated (MM-DD-YYYY HH:MM)  
  - Star count, forks, and more

- 📡 **Offline Support (with Hive)**  
  - Fetched data is saved locally using `hive_flutter`
  - Browse previously loaded repositories offline  
  - Data persists between app restarts

- 🌙 **Theme Support (Light & Dark)**  
  Toggle automatically based on system settings with Material 3 color scheme

- 🧪 **App Flavors**  
  Easily switch between development and production API endpoints using build flavors


## 🧱 Architecture

This project follows a **hybrid architecture** with a clean separation between **application logic** and **presentation**. The app is structured into **modular features**, promoting scalability, testability, and clean code principles.



---

## 📦 Packages Used

| Package | Description |
|--------|-------------|
| [`provider`](https://pub.dev/packages/provider) | State management |
| [`hive_flutter`](https://pub.dev/packages/hive_flutter) | Local data persistence |
| [`http`](https://pub.dev/packages/http) | API requests |
| [`cached_network_image`] for image cache.

# Flutter Version: 3.29.0


##  Install Dependencies
    flutter pub get

##  Run the project
    write "flutter run" in project terminal or just use your IDE to run it in emulator

