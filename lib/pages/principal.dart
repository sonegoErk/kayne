import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kaynewest/style/colors.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String _quote = "";

  Future<void> _fetchQuote() async {
    final url = Uri.parse('https://api.kanye.rest/');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _quote = data['quote'];
        });
      } else {
        setState(() {
          _quote = "Erro ao buscar a frase. Tente novamente.";
        });
      }
    } catch (e) {
      setState(() {
        _quote = "Erro ao conectar à API.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.preto,
        automaticallyImplyLeading: false, // Remove a seta de voltar
        title: const Center(
          child: Text(
            "Frases do Kanye West",
            style: TextStyle(color: AppColors.branco),
          ),
        ),
      ),
      backgroundColor: AppColors.preto,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _quote,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Cor da fonte
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _fetchQuote,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 0,
                backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero),
              ),
              child: Image.asset('assets/images/bear.png'),
            ),
          ],
        ),
      ),
    );
  }
}
