import 'dart:ui';

class DisplayMetricsProvider {
  DisplayMetrics get() {
    final double devicePixelRatio =
        PlatformDispatcher.instance.views.first.physicalSize.aspectRatio;
    final double width =
        PlatformDispatcher.instance.views.first.physicalSize.width;
    final double height =
        PlatformDispatcher.instance.views.first.physicalSize.height;

    return DisplayMetrics(width, height, devicePixelRatio);
  }
}

class DisplayMetrics {
  DisplayMetrics(this.width, this.height, this.pixelRatio);
  final double width;
  final double height;
  final double pixelRatio;
}
