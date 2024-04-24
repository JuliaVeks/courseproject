import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class QuoteService {
  Future<Quote> fetchQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Quote.fromJson(data);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
