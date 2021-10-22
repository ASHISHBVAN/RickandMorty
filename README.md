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
1.there are to folders called view which conatins front end and logic where the app logic lies
2. in view folder there are 2 view episodes and characters
   View ->  episodes -> will display pages and 10 episodes per page in the form of list
                     -> it displays name of the episode and season
                     -> we can click on it to view the character of the perticular episode
        -> character -> this is the second view which will display characters
                     -> it displays the name of character and gender
                     -> we can filter the list by gender by applying the filter provided in bottom appBar
                     -> we can search character by name using search function in top appBar
                     -> we can go to previous page using back arrow key in top appBar

4. in logic folder there are 2 logics episodelogic and characterlogic
   both -> will provide the logic for the views

5. i have used dio package for accesing the data using url
6. provider is used for state management

