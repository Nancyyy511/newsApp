import 'package:flutter/material.dart';

extension ContextExyension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
