class ImageConstant {
  static ImageConstant? _instace;
  static ImageConstant get instance {
    _instace ??= ImageConstant._init();
    return _instace!;
  }

  ImageConstant._init();
  final cow = "cow".toPng;
  final grafic = "grafic".toPng;
}

extension _ImagePathExtension on String {
  String get toPng => "assets/$this.png";
}
