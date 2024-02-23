# Flutter Clean Architecture Example

This is an example project demonstrating how you can create a Flutter Music app using clean architecture. It has a minimal UI, which I may continue to enhance as time permits. The app includes the following:

* Retrofit for fetching sample data from a public [mock data source](https://mocki.io/v1/50e26bd0-27e6-4183-93fc-ca9da2662366)
* Drift database
* GetIt dependency injection
* json_theme for reading themes generated on [apppainter.dev](https://appainter.dev/). This allows for easy skinning of your app.
 - Note we use json_theme version 5.0.2. 6+ appears to have conflicts with other libraries. 

## Credits

### Drift Local Database Example

[drift\_local\_database\_example\_using\_drift\_file](https://github.com/r1n1os/clean_architecture_with_database_using_drift_file)

This is a really useful and simple intro to Drift database. If you're new to Flutter or any of these concepts, I recommend starting with this repo. It's an example project demostrating how you can integrate Drift local database (using the .drift file) into your flutter app. It includes a complete database implementation in Drift. It shows separate implementations using .drift files and Dart classes with annotations (note that my app uses the .drift implementation only). It demonstrates the following:

* Drift Database Setup
* How to implement One to One Relationship
* How to implement One to Many Relationship
* How to implement Many to Many Relationship
* How to accomplish migration

#### Medium  Articles for Drift Local Database Example: 

* [Intro Setup And Migration](https://r1n1os.medium.com/drift-local-database-for-flutter-part-1-intro-setup-and-migration-09a64d44f6df)
* [One to One Relationship] (https://r1n1os.medium.com/drift-local-database-for-flutter-part-2-one-to-one-relationship-a3a921a53e55)
* [One to Many Relationship] (https://r1n1os.medium.com/drift-local-database-for-flutter-part-3-one-to-many-relationship-43f24fcc474d)
* [Many to Many Relationship] (https://r1n1os.medium.com/drift-local-database-for-flutter-part-4-many-to-many-relationship-9775b81453d2) 

### News App Clean Architecture

[Flutter-News-App-Clean-Architecture](https://github.com/mahdinazmi/Flutter-News-App-Clean-Architecture)

I'm fairly new to Flutter, so this repo was incredibly helpful in showing how all the pieces fit together. It uses a Floor database, whereas mine uses Drift. It demonstrates the following:

* Clean architecture setup
* Floor Database
* GetIt dependency injection
* Retrofit API calls
* Bloc state management (which I don't use...yet, I use Provider)

#### YouTube Playlist for Flutter-News-App-Clean-Architecture

https://www.youtube.com/watch?v=-4fTwPbuDPs

## References:
 * Package page: https://pub.dev/packages/drift
 * Drift page: https://drift.simonbinder.eu/docs/

## Clean Architecture:
 * entity contains the high-level business logic classes
 * model is closely related to the database. It maps to a database table and columns
