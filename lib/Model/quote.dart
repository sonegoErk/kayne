class Resposta {
  String quote;

  Resposta({
    required this.quote,
  });

  Map<String, dynamic> toJson() {
    return {
      'quote': quote,
    };
  }

  factory Resposta.fromJson(Map<String, dynamic> json) {
    return Resposta(
      quote: json['quote'],
    );
  }
}