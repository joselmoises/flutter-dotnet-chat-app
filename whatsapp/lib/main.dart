import 'package:flutter/material.dart';
import 'package:whatsapp/pages/login.dart';

void main() => runApp(
  MaterialApp(
    home: Login(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF075E54),
        secondary: Color(0xFF25D366),
      ),
    ),

    debugShowCheckedModeBanner: false,
  ),
);
