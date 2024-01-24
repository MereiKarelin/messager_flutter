import 'package:flutter/material.dart';

abstract class Navigable extends Widget {
  const Navigable({super.key});

  String getName();
}
