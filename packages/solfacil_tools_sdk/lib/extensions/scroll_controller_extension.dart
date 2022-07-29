// coverage:ignore-file
import 'package:flutter/material.dart';

extension ScrollControllerExtensions on ScrollController {
  scrollDown({
    int delay = 0,
    Duration animateDuration = const Duration(milliseconds: 300),
  }) async {
    await Future.delayed(Duration(milliseconds: delay));
    animateTo(
      position.maxScrollExtent,
      duration: animateDuration,
      curve: Curves.easeInOut,
    );
  }
}
