import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterdatabase/models/coach.dart';
import 'package:flutterdatabase/backend/authservice.dart';
import 'package:flutterdatabase/screens/wrapper.dart';
import 'package:flutterdatabase/firebase_options.dart';

FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Database());
}

class Database extends StatelessWidget {
  const Database({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Coach?>.value(
        value: AuthService().user,
        initialData: null,
        child: const MaterialApp(home: Wrapper()));
  }
}
