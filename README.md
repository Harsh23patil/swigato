# Food Delivery App

This app will be developed using Flutter for the front end and Supabase for backend services. It aims to deliver a seamless and efficient food delivery experience with modern UI/UX and robust backend integration.

# Modules ➖

### 1. **Onboarding**

- Welcome screens with app features overview.
- User sign-up/login integration using Supabase authentication.
- Support for social logins (Google, Facebook, etc.).

### 2. **Home Page Module**

- Displays featured restaurants and popular dishes.
- Personalized recommendations based on user preferences.
- Categories for easy navigation.

### 3. **Search Module**

- Search functionality for restaurants, cuisines, or dishes.
- Filters for price, ratings, distance, and delivery time.
- Auto-complete suggestions and recent search history.

### 4. **Food and Restaurant Detail Module**

- Detailed view of selected restaurant and its menu.
- Food item details with ingredients, nutrition info, and pricing.
- Option to mark as favorite or add to cart.

### 5. **My Cart Module**

- View selected items with quantity adjustments.
- Promo code application and discount calculation.
- Real-time price updates and estimated delivery time.

### 6. **Payment Module**

- Integration with multiple payment gateways (UPI, Cards, Wallets, etc.).
- Secure transaction handling.
- Save card details and payment preferences.

### 7. **Order Tracking Module**

- Real-time order status updates.
- Live tracking of delivery personnel.
- Notifications for order progress (e.g., order placed, out for delivery).

### 8. **Chat Module**

- Direct chat with delivery personnel or customer support.
- Canned responses for common queries.
- Support for multimedia messages (e.g., images of issues).

### 9. **My Profile Module**

- User profile management (name, contact info, preferences).
- Address book for saved delivery addresses.
- Wallet balance and loyalty points tracking.

### 10. **History and My Orders Module**

- List of past orders with details.
- Option to reorder previous meals.
- Feedback and rating submission for completed orders.

## **Supabase Integration** ➖

### **Key Features:**

1. **Database:**
    - Centralized storage for user, restaurant, and order data.
    - Relations between entities like users, orders, and restaurants using foreign keys.
    - Schema design for scalability and data integrity.
2. **Authentication and Authorization:**
    - Email/password-based authentication.
    - Social login integrations.
    - Role-based access control for admin, delivery agents, and customers.
3. **Storage:**
    - Image storage for food items, restaurants, and user profiles.
    - Efficient handling of large media files.
4. **Real-Time Updates:**
    - Order status updates.
    - Notification handling for chat and order events.
5. **Schema Design:**
    - **Users:** Stores user information like name, email, and role.
    - **Restaurants:** Stores restaurant details, menu items, and ratings.
    - **Orders:** Tracks user orders, delivery status, and payment details.
    - **Chats:** Handles real-time messaging data.
    - **Reviews:** Stores user feedback and ratings.

## **Technology Stack** ➖

### **Frontend**

1. **Flutter**
    - Building cross-platform UI for Android and iOS.
    - Focus on modern, responsive designs.
2. **State Management**
    - **bloc** and **Cubit** for predictable and scalable state management.
3. **Dependency Injection**
    - **get_it** for easy service locator pattern implementation.
4. **Local Storage**
    - **Hive** for lightweight and fast local data storage.
5. **Functional Programming**
    - **fpdart** for functional programming paradigms.

### **Backend**

1. **Supabase**
    - Handles database, authentication, and real-time data.
    - Simplifies API development with built-in features.
2. **Other Integrations**
    - Payment gateways (Razorpay, Stripe, etc.).
    - Notification services (Firebase or Supabase Push Notifications).

## **Development Plan** ➖

1. Define the project scope and create a detailed wireframe.
2. Set up the Supabase backend with schema design and configurations.
3. Develop modular components in Flutter, integrating Supabase APIs.
4. Implement state management using bloc and Cubit.
5. Perform thorough testing (unit, integration, and UI tests).
6. Launch beta testing and collect user feedback.
7. Release the app to production on App Store and Play Store.

## UI/UX ➖

All the UI will be followed by using the following figma design. UI url - https://www.figma.com/design/3J1we1wjnPWmhrmiT7uz46/Food-Delivery-App-(Community)?node-id=0-1&p=f&t=oWElPOjb5XJZE95V-0



lib/
│── core/
│   ├── theme/            # Theme-related files (colors, typography, dark mode, etc.)
│   │   ├── theme.dart
│   │   ├── light_theme.dart
│   │   ├── dark_theme.dart
│   │   ├── app_colors.dart
│   │   ├── app_fonts.dart
│   │   ├── app_text_styles.dart
│   │
│   ├── constants/        # Application-wide constants (strings, APIs, assets)
│   │   ├── app_constants.dart
│   │   ├── app_strings.dart
│   │   ├── api_endpoints.dart
│   │   ├── asset_paths.dart
│   │
│   ├── utils/            # Helper functions (date, validation, formatting, etc.)
│   │   ├── date_utils.dart
│   │   ├── validators.dart
│   │   ├── formatter.dart
│   │
│   ├── network/          # Networking (Dio/HTTP client, API services, error handling)
│   │   ├── api_client.dart
│   │   ├── api_service.dart
│   │   ├── network_exceptions.dart
│   │
│   ├── widgets/          # Common reusable UI components
│   │   ├── custom_button.dart
│   │   ├── custom_textfield.dart
│   │   ├── loading_indicator.dart
│   │
│   ├── services/         # Services for Firebase, notifications, local storage, etc.
│   │   ├── local_storage_service.dart
│   │   ├── notification_service.dart
│   │   ├── firebase_service.dart
│   │
│   ├── config/           # Environment & app-level configurations
│   │   ├── environment.dart
│   │   ├── app_config.dart
│   │
│   ├── enums/            # App-wide enums
│   │   ├── user_role.dart
│   │   ├── order_status.dart
│   │
│   ├── extensions/       # Useful Dart/Flutter extensions
│   │   ├── context_extensions.dart
│   │   ├── string_extensions.dart
│   │
│   ├── di/               # Dependency injection (GetIt, Provider, Riverpod)
│   │   ├── dependency_injection.dart



Folder	                                Purpose
theme/	        Stores global theme settings, colors, typography, and dark/light themes.
constants/	    Contains static values like API endpoints, asset paths, and app-wide constants.
utils/	        Houses reusable utility functions (date formatting, validation, etc.).
network/	    Manages API calls, error handling, and network requests.
widgets/	    Stores reusable UI components (custom buttons, text fields, etc.).
services/	    Contains app services like Firebase, local storage, notifications, etc.
config/	        Manages environment-based configurations and app settings.
enums/  	    Holds app-wide enumerations (e.g., user roles, order statuses).
extensions/	    Stores Dart extensions for adding extra functionality to existing classes.
di/	Manages     dependency injection using GetIt, Provider, or Riverpod.