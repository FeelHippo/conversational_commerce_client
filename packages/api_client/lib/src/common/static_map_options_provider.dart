import 'dart:math' as math;

import 'display_metrics_provider.dart';

class StaticMapOptionsProvider {
  StaticMapOptionsProvider(this._displayMetricsProvider);

  final DisplayMetricsProvider _displayMetricsProvider;

  StaticMapOptions get() {
    final DisplayMetrics displayMetrics = _displayMetricsProvider.get();
    int mapScale = math.min(displayMetrics.pixelRatio.floor(), 4);
    if (mapScale == 3) {
      mapScale = 4;
    }

    return StaticMapOptions(
      720,
      450,
      mapScale,
    );
  }
}

class StaticMapOptions {
  const StaticMapOptions(this.width, this.height, this.scale);

  final int width;
  final int height;
  final int scale;
}
