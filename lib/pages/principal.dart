import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: const Text("Frases do Kanye West"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _quote,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: _fetchQuote,
              child: const Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
