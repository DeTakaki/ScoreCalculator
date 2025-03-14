# ScoreCalculator

A financial wellness score calculator based on your income.

## Getting started

The project is based on Flutter 3.22.2. Please make sure that your Flutter SDK is updated accordingly.

### Cloning the project

After cloning the project, make sure to go into `pubspec.yaml` and download all the dependencies, or run `flutter pub get` in your terminal.

## Basic folder structure

This project is based on Dart's best practices on styling [Effective Dart: Style](https://dart.dev/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores). If you're not familiar with that, it is advised to learn Dart's styling convention.

The folder hierarchy is as follows:
> score_calculator
>> lib <- base folder
>>> src <- code
>>>> base, constants, core, routing, util <- feature division


### The routing folder

The routing folder contains the app's navigation scheme. `GoRouter` is the choice of library as it allows a better control over Flutter's `Navigator`. The file's disposition is made with scalability in mind, as GoRouter allows a good implementation of [Deep linking](https://docs.flutter.dev/ui/navigation/deep-linking).

#### routes_strings.dart

For every new screen created in the app, it is needed to create its name as a `String` on [routes_strings.dart](/score_calculator/lib/src/routing/routes_strings.dart).

#### app_router

Also with every new screen, a new `GoRoute` must be added in [app_router.dart](/score_calculator/lib/src/routing/app_router.dart). If you're adding a route that is dependant on another route eg. `Results depends on Home` then it must be added as that Route's route. This helps whenever creating stacks of navigation between screens and whenever a deep link route is created, as to create a navigation history.

### The constants folder

Use the constants folder to store anything that is going to be widely used in the app. `Colors`, `Sizes` and `Images` are all examples. This approach is made with centralizing the reused assets in mind. So whenever a new `color` is introduced, it is easy to check whether said color already exists. Naming convention should be the place wherever the color is going to be used. For example, a light gray color `textColor` to indicate the color to be used project wide, when referring to labels's texts.

#### Features

Each feature should have three main folders: `Data`, `Domain` and `Presentation`. A feature-first approach is preferred for project scalability. A domain-first would grow in size rather quickly, making the project hard to read and understand as time goes by.


### Data

For data, you should always have a **Single source of truth (SSOT)**. Whether is from remote data, or local data. So your datasources for said feature should be in this folder.


### Domain

Use the domain folder to store models related to the feature. If there is a common model for features, then the model should be inserted into the core domain so it isn't stored in a place that has little to no relation to the feature being developed.

### Presentation

The presentation folder gets split into three sub-folders: `Screens`, `Widgets` and `Providers`. Screens should handle the highest layer of the view, as in literally screens. Then, whenever you need to reuse a widget, said widget must be stored inside the `widgets` folder. This is made to make sure that the app is modularized, and can expand in size while not growing in the same rate in files and folders. 

Widgets always follow the convention `foo_kind_of_widget.dart`. Take as example the footer in the project. We named it `security_footer.dart`. So when someone needs to import this footer, it is clear what kind of widget this is.

Providers are used to maintain state in the app. `Riverpod` is the choice here, being an extension of `Provider`, it brings new possibilities to keep the business rules and data binding far from the View. The idea here is to keep an architecture as close to MVVM as possible, as this is the architecture recommended by [Flutter](https://docs.flutter.dev/app-architecture). 

Riverpod is also the choice made because it facilitates the way to implement repositories that reach the datasources to request data that will be sent to the View, thus making the app ready to implement REST requests for example.

Every widget is made with performance in mind. So, all classes that extends either `StatelessWidget` or `StatefulWidget` must be `const`.

