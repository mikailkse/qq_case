// ignore_for_file: non_constant_identifier_names

class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  final qq_logo = 'qq_logo'.toPNG;
}

extension ImageConstantsExtension on String {
  String get toPNG => 'assets/$this.png';
}
