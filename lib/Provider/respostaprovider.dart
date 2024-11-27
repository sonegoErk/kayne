import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kaynewest/Model/quote.dart';
import 'package:http/http.dart' as http;

class QuoteProvider with ChangeNotifier {
  Resposta? _quote;

  Resposta? get quote => _quote;

  Future<void> getQuote() async {
    final url = Uri.parse('https://api.kanye.rest/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _quote = Resposta.fromJson(data);
        notifyListeners();
      } else {
        throw Exception('Erro ao buscar a citação');
      }
    } catch (error) {
      rethrow;
    }
  }
}
