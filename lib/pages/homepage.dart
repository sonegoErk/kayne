import 'package:flutter/material.dart';
import 'package:kaynewest/style/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: const Text('Kayne West maior músico do mundo', style: TextStyle(
            color: AppColors.preto
          ),),
        ),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/principal');
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
        ),
        child: Image.asset('assets/images/logo.jpg', scale: 3,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      )),
    );
  }
}