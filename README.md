# 📱 ArticleApp

ArticleApp is a modern iOS application built using **UIKit** that displays a list of articles with support for **Grid and List views**, smooth navigation, and clean UI design.

This project demonstrates strong fundamentals of **iOS development**, including collection view layouts, navigation flow, and UI state handling.

---

## 🚀 Features

### 📑 Article Listing

* Displays articles using **UICollectionView**
* Supports **dynamic layout switching**:

  * 🔲 Grid View
  * 📋 List View

### 🔄 Grid / List Toggle

* Seamless switching between layouts
* Optimized spacing and responsive design

### 📄 Article Detail Screen

* Shows complete article information
* Clean and structured UI layout
* Smooth navigation using **UINavigationController**

### ❤️ Like / Dislike Functionality

* Toggle like/dislike state
* UI updates instantly on user interaction

### 🖼️ Image Handling

* Displays article images efficiently
* Supports remote/local image loading (based on your implementation)

---

## 🛠️ Tech Stack

| Technology       | Usage                     |
| ---------------- | ------------------------- |
| Swift            | Core programming language |
| UIKit            | UI development            |
| UICollectionView | Display articles          |
| MVC Architecture | Code organization         |

---

## 📂 Project Structure

```bash
ArticleApp/
│
├── App Base/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
│
├── Managers/
│   └── Core/
│       └── ArticleManager.swift
│
├── Models/
│   └── Core/
│       └── Article.swift
│
├── Provider/
│   ├── Client/
│   └── Core/
│
├── Resources/
│   ├── AppColors.swift
│   ├── AppFonts.swift
│   └── Assets.xcassets
│
├── Supporting Files/
│   └── Info.plist
│
├── ViewControllers/
│   └── Article/
│       ├── ArticleListVC.swift
│       └── ArticleDetailVC.swift
│
├── Views/
│   ├── Cells/
│   │   ├── ArticleCollectionCell.swift
│   │   └── ArticleGridCell.swift
│   │
│   └── XIBs/
│       ├── ArticleCollectionCell.xib
│       ├── ArticleGridCell.xib
│       ├── LaunchScreen.xib
│       └── Main.xib
│
└── Info.plist
```

## 📸 Screenshots (iPhone)

<img src="https://github.com/user-attachments/assets/b15cf3e2-ce5d-4851-a66b-005002fc3c4d" width="250"/> <br><br>

<img src="https://github.com/user-attachments/assets/354d78a7-f469-46a8-8cd3-86294b21ae62" width="250"/> <br><br>

<img src="https://github.com/user-attachments/assets/9359c6a2-f46e-4206-8754-4cb9d0ac0e28" width="250"/> <br><br>

<img src="https://github.com/user-attachments/assets/0c0640bc-5bd1-4ea4-8733-cc964051ed57" width="250"/> <br><br>

<img src="https://github.com/user-attachments/assets/f208fe80-f077-41f4-80bf-453afe3a9aad" width="250"/>


## 📸 Screenshots (iPad)

<img src="https://github.com/user-attachments/assets/5fe4e07e-55f3-436e-91b6-01945ab74444" width="300"/> <br><br>

<img src="https://github.com/user-attachments/assets/9cbdd29d-027a-4cc3-9daf-460ae080f4d8" width="300"/> <br><br>

<img src="https://github.com/user-attachments/assets/8eb75f4b-10ad-4e32-b598-ac536ec988eb" width="300"/> <br><br>

<img src="https://github.com/user-attachments/assets/75aa5850-4581-40b3-b0bc-76327f6353e0" width="300"/>



## ⚙️ Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/sanjaysadhu/ArticleApp.git
   ```

2. Open project in Xcode:

   * Open `ArticleApp.xcodeproj`

3. Run the app:

   * Select simulator or real device
   * Press ▶️ Run

---

## 🧠 Key Learnings

* UICollectionView with multiple layouts
* Handling UI state changes dynamically
* Navigation between view controllers
* Clean architecture using MVC
* User interaction handling (like/dislike)

---

## 🔮 Future Improvements

* 🔗 API integration for real-time articles
* 🎞️ Smooth animations & transitions

---
