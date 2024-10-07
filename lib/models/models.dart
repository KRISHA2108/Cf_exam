import 'dart:io';

import 'package:flutter/cupertino.dart';

class GlobalModel {
  static String student_name = "";
  static String student_grid = "";
  static String student_standard = "";
  static File? student_image;

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
}

class Globals {
  final String student_name;
  final String student_grid;
  final String student_standard;
  final File? student_image;

  static File? image;

  Globals({
    required this.student_name,
    required this.student_grid,
    required this.student_standard,
    required this.student_image,
  });
}

List<Globals> data = [];
