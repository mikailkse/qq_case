import 'enviroment.dart';

class AppConfig {
  static AppConfig get instance => _instance ??= AppConfig();
  static AppConfig? _instance;

  late Env enviroment;

  setAppParameters({
    required Env enviroment,
  }) {
    this.enviroment = enviroment;
  }

  setProdParameters() {
    setAppParameters(
      enviroment: Env.prod,
    );
  }

  setDevParameters() {
    setAppParameters(
      enviroment: Env.dev,
    );
  }
}
