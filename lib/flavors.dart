enum Flavor {
  dev,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev: Template Bloc';
      case Flavor.prod:
        return 'Template Bloc';
    }
  }
}

extension FlavorExtension on Flavor {
  bool get isDev => this == Flavor.dev;
  bool get isProd => this == Flavor.prod;
}
