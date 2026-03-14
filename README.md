# Shopaholic - Flutter Mini E-Commerce Catalog App

Shopaholic is a simple Flutter-based mini e-commerce catalog application.  
The application allows users to browse products, view product details, and manage items in a shopping cart.

This project was developed as a practice project to learn Flutter UI development, state management using StatefulWidget, and working with JSON-based product data.

---

## Features

- Product catalog displayed in **GridView**
- **Product detail page** with image, description, and price
- **Add to Cart** functionality
- **Cart screen** with:
  - quantity increase/decrease
  - item removal
  - subtotal calculation
- **Banner slider** on the home screen
- Styled **Shopaholic AppBar**
- Light purple themed UI
- Hover effects for interactive UI elements

---

## Project Structure


lib/
├── models/
│ product.dart
│ cart_item.dart
│
├── services/
│ product_service.dart
│
├── screens/
│ product_list_screen.dart
│ product_detail_screen.dart
│ cart_screen.dart
│
├── widgets/
│ product_card.dart
│ banner_slider.dart
│
└── main.dart


### Explanation

- **models**  
  Contains data models used in the application.

- **services**  
  Handles product data loading (dummy data).

- **screens**  
  All major UI pages of the application.

- **widgets**  
  Reusable UI components such as product cards and banners.

---

## Technologies Used

- Flutter
- Dart
- Material UI
- Stateful Widgets
- GridView & ListView
- JSON-based dummy data

---

## Screens

### Home Screen
Displays product banners and product grid.

### Product Detail Screen
Shows detailed information about the selected product.

### Cart Screen
Displays selected products, quantities, and total price.
## Installation

1. Clone the repository


git clone https://github.com/Sanalikhan/shopaholic.git


2. Navigate to the project folder


cd shopaholic


3. Install dependencies


flutter pub get


4. Run the app


flutter run