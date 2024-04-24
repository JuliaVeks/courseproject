import 'package:flutter/material.dart';
import '../widgets/daily_quote_card.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';

class DailyQuoteScreen extends StatefulWidget {
  @override
  _DailyQuoteScreenState createState() => _DailyQuoteScreenState();
}

class _DailyQuoteScreenState extends State<DailyQuoteScreen> {
  late Future<Quote> _quoteFuture;
  final QuoteService _quoteService = QuoteService();

  @override
  void initState() {
    super.initState();
    _quoteFuture = _quoteService.fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Цитата дня',
          style: TextStyle(
            color: Color(0xFF877DA1), // Фиолетовый цвет
            fontWeight: FontWeight.w300, // Тонкий шрифт
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<Quote>(
          future: _quoteFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Ошибка загрузки цитаты');
            } else {
              return DailyQuoteCard(quote: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
