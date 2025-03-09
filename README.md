# **User Profile App**

A Flutter application that displays a user profile page with tabs for **Posts, Comments, and Stats**.  
The app features a custom AppBar, profile picture, bio, and dynamically switching views based on the selected tab.

## Screenshots

<img src="https://github.com/user-attachments/assets/90746c6e-051a-483b-8b3e-b41ebbb09693" width="300">
<img src="https://github.com/user-attachments/assets/bcf89c66-7d07-4851-b251-d8197dd72c94" width="300">
<img src="https://github.com/user-attachments/assets/4416cd76-aba6-4219-9f06-ceabb4096d48" width="300">

## **Features**
- **Custom AppBar** with a unique shape.  
- **Profile Section** with a picture, name, and bio.  
- **Tab-based navigation** for Posts, Comments, and Stats.  
- **ListView-based UI** to display posts and comments.  
- **Dynamic UI updates** based on user interaction.  

 ##  Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/Isht-dev190/User-Profile-App.git
   cd user-profile-app
   
2. Install Dependencies:
   ```sh
   flutter pub get

3. Run the App:
   ```sh
   flutter run

## **Project Structure**
```
user-profile-app/
│-- lib/
│   ├── main.dart  # Main entry point of the application
│   ├── widgets/
│   │   ├── custom_appBar.dart  # Custom AppBar implementation
│   ├── assets/
│   │   ├── images/
│   │   │   ├── pfp.jpeg  # Profile picture
│   │   │   ├── Picture.png  # Default post image
│   │   ├── icons/
│   │   │   ├── arrow.svg  # Arrow icon used in comments
│-- pubspec.yaml  # Dependencies configuration
```
    
##  Usage

- **Posts Tab:** Displays a list of events with details like title, date, location, and author.
- **Comments Tab:** Shows user comments with a title, comment text, and timestamp.
- **Stats Tab:** Displays the number of posts and comments in a simple UI.

##  Future Improvements

- Add **backend integration** for fetching real user data.
- Improve **profile customization** options.
- Enhance **UI animations** for better user experience.

##  License
This project is licensed under the MIT License - see the LICENSE file for details.
