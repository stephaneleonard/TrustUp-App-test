# TrustUp-App-test
Test for the TrustUp app as a demo

# Flutter version
Tested on Flutter  main channel currently on 2.2.3 with non-nullable enabled.

# How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/stephaneleonard/TrustUp-App-test.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
cd mytrustup
flutter pub get 
```

**Step 3:**

Run the project using
```
flutter run
```

# How to Build for production

To experience the real speed of the app it's needed to run it in release mode.

**Step 1:**

Build the apk

```
flutter build apk --release
```

**Step 2:**

Install it on your android device

```
flutter install 
```

# Features
- Bottom Navigation
- Top Drawer
- Routing
- Bloc state management
- Api calls

## Folder structure
```
lib/
- cubit: state management/ controller
- models
- utils
- views
- widget: widget shared by multiple pages
```

## State management
The state management was handled using the Bloc package.


