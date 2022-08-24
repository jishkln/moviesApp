import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int millisecons;
  VoidCallback? action;
  Timer? _timer;
  Debouncer({required this.millisecons});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: millisecons), action);
  }
}
