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
<img width="1320" height="2868" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-18 at 13 30 44" src="https://github.com/user-attachments/assets/30e185a1-d274-4ed3-9805-aff04ec3510b" /> <br><br>
<img width="1320" height="2868" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-18 at 13 30 56" src="https://github.com/user-attachments/assets/84591db7-d44f-406d-bac3-230db3d497fa" /> <br><br>
<img width="1320" height="2868" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-18 at 13 31 07" src="https://github.com/user-attachments/assets/6da97a5c-ddbf-4f98-bed6-9da205037085" /> <br><br>
<img width="1320" height="2868" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-18 at 13 31 42" src="https://github.com/user-attachments/assets/d65613f2-acb8-4bed-ba8c-d0391e18049f" /> <br><br>
<img width="1320" height="2868" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-03-18 at 13 51 22" src="https://github.com/user-attachments/assets/b9505913-78b0-4d45-bd72-5354e9914243" /> <br><br>


## 📸 Screenshots (iPad)
<img width="2064" height="2752" alt="Simulator Screenshot - iPad Pro 13-inch (M5) - 2026-03-18 at 14 24 05" src="https://github.com/user-attachments/assets/fcd9cfc5-3d24-4ed8-9769-b9d37fcf7a4d" /> <br><br>
<img width="2064" height="2752" alt="Simulator Screenshot - iPad Pro 13-inch (M5) - 2026-03-18 at 14 24 12" src="https://github.com/user-attachments/assets/4146c645-bc93-41ca-9662-fa76eca2a5cc" /> <br><br>
<img width="2064" height="2752" alt="Simulator Screenshot - iPad Pro 13-inch (M5) - 2026-03-18 at 14 24 20" src="https://github.com/user-attachments/assets/9e4573a9-956c-438a-b4fa-8ef6048cf85d" /> <br><br>
<img width="2064" height="2752" alt="Simulator Screenshot - iPad Pro 13-inch (M5) - 2026-03-18 at 14 26 11" src="https://github.com/user-attachments/assets/4dfeff82-9115-4555-a199-fd0b45aa3d1d" /> <br><br>


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
