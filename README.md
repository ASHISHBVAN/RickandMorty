# rick_and_morty

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Notes:
some instructions for App:
0. Main page which is the entry point of app.
1. There are to folders called view which conatins front end and logic where the app logic lies.
2. In view folder there are 2 view episodes and characters.
3. Episodes -> will display pages and N episodes per page in the form of list
                     -> It displays name of the episode and season
                     -> We can click on it to view the character of the perticular episode.
4. Character -> This is the second view which will display characters
                     -> It displays the name of character and gender
                     -> We can filter the list by gender by applying the filter provided in bottom appBar
                     -> We can search character by name using search function in top appBar
                     -> We can go to previous page using back arrow key in top appBar.

5. In logic folder there are 2 logics episodelogic and characterlogic.
6. Both -> will provide the logic for the views.
7. I have used dio package for accesing the data using url.
8. Provider is used for state management.
9. Drive link for the APK : https://drive.google.com/file/d/1mvqP0rKlQ9pBDmzf2anm-YXsP9Gwzswy/view?usp=sharing

