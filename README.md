<img src="./assets/images/poke_icon.png" width="50%" alt="logo" />
<h2 align="center">
  A Flutter project to showcase simple API REST calls and info display.
</h2>

# PokeReader

<img src="./assets/images/showcase.gif" alt="logo" align="center"/>

## Installation

- Make sure you have `Flutter v1.20.4` installed
- Run `flutter packages get` in the project folder
- Run `flutter run --release` in the terminal

> If the project doesn't run, verify the errors that the console is throwing and contact [ElZombieIsra](https://twitter.com/zombieisra)

## Technical showcase

The technical skill to evaluate in this assestment are:

- Data persistency
- Http calls to an API
- Folder structuration
- Technical concepts differentiation
- Asynchronus programming
- CLEAN architecture use
- Hero animations
- State management with BLoC

## Packages chosen

Here lies a list of all the packages chosen to make the assestment an a small explanation why they were chosen

- `flutter_bloc: ^6.0.5`: A state manager for API calls and reactive programming. Chosen because I feel comfortable structuring apps with this package, its the one recommended by Google and with the latest major update that introduces **Cubit** it's more easy to build apps with it.
- `equatable: ^1.2.5`: This plugin was used to have better equality comparisons within Dart and the built models.
- `json_serializable: ^3.4.1`: Chosen for code generation of the `toJson` and `fromJson` methods used in the built models. It helps to build models and consume APIs faster.
- `tuple: ^1.0.3`: Used because I needed to return multiple values from a method but without building a custom Model. This package allows to return a **Tuple** with multiple **_strongly typed_** values so the developer always knows what to expect. Thats an advantage over using `Map<String, dynamic>` or a `List<dynamic>` to return the values.
- `dio: ^3.0.10`: Http calls improved for status code checks, transformers, improved errors, etc.
- `shared_preferences: ^0.5.10`: Chosen over other data persistency options because it's simple to use and for this use case we didn't need something more robust.

## Areas to improve

- Some models were not parsed for simplicity of the code but they can be generated.
- The data persistency needs to be migrated to something more robust if the project scales up.
- Some methods can be commented so the developers have a little more context about what a method do.

## Contact

Contact me on:

- [Twitter](https://twitter.com/zombieisra)
- [LinkedIn](https://www.linkedin.com/in/israel-ibarra/)
- [Email](mailto:israel.ibarra@deimos.app)
