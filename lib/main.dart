import 'package:flutter/material.dart';
import 'package:kaynewest/Provider/respostaprovider.dart';
import 'package:kaynewest/pages/homepage.dart';
import 'package:kaynewest/pages/principal.dart';
import 'package:provider/provider.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuoteProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Homepage(),
          '/principal': (context) => const Principal(),
        },
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
