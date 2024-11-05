import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:stadtplan/firebase_options.dart';

Future<void> initFirebase() async {
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  } catch (e) {
    Fimber.e('Error Initializing App: $e');
  }
}
