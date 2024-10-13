// ignore: eol_at_end_of_file
enum Flavor{customer, admin}


class FlavorConfig {
    FlavorConfig._internal(this.flavor);
  final Flavor flavor;

  static FlavorConfig? _instance;

  static void initialize(Flavor flavor) {
    _instance ??= FlavorConfig._internal(flavor);
  }

  static FlavorConfig get instance {
    return _instance!;
  }
}
