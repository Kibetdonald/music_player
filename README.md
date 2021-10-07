# music_player
 Music Player APP Overview 
 ![Screenshot_20211007-074409](https://user-images.githubusercontent.com/50916200/136321825-fa2d83fb-64b4-49f5-bfe1-34f6c0191c52.png)

Getting Started
Its a music player application created in flutter and uses the audio packages from pub.dev
When users allow access to the internal memory it retrieves all music files from the device
and displays them on the player, so that users can choose the music of their choice.

How to Use
Step 1:

Download or clone this repo by using the link below:

https://github.com/Kibetdonald/music_player.git
Step 2:

Go to project root and execute the following command in console to get the required dependencies:

flutter pub get 
Step 3:

This project uses inject library that works with code generation, execute the following command to generate files:

flutter packages pub run build_runner build --delete-conflicting-outputs
or watch command in order to keep the source code synced automatically:

flutter packages pub run build_runner watch


 To Run the app on an emulator run:
 
IDE run args/configuration
To set this up in your IDE of choice, you can use:

IntelliJ/Android Studio: 
    "Edit Configurations" (in your run configurations) → "Additional run args".
VS Code: 
    search for "Flutter run additional args" in your user settings.
    
In both cases, add --no-sound-null-safety.

