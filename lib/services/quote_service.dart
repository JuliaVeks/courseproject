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
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/quote.dart';

class QuoteService {
  final CollectionReference _quotesCollection = FirebaseFirestore.instance.collection('quotes');

  Future<void> addQuoteToFavorites(Quote quote) async {
    await _quotesCollection.add({
      'text': quote.text,
      'author': quote.author,
      'timestamp': DateTime.now(),
    });
  }

  Stream<List<Quote>> getFavoriteQuotes() {
    return _quotesCollection.orderBy('timestamp', descending: true).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Quote(
          text: doc['text'],
          author: doc['author'],
        )).toList());
  }
}

*/