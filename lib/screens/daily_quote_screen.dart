import 'package:flutter/material.dart';
import '../services/favorite_quotes.dart';
import '../widgets/daily_quote_card.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';
import 'favorite_quotes_screen.dart'; // Импортируем экран с избранными цитатами

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

  void _addToFavorites(Quote quote) async {
    await FavoriteQuotes.toggleFavorite(quote.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Цитата дня',
          style: TextStyle(
            color: Color(0xFF877DA1), // Фиолетовый цвет Матириал Дизайн
            fontWeight: FontWeight.w300, // Тонкий шрифт Roboto
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
              return DailyQuoteCard(
                quote: snapshot.data!,
                onFavoritePressed: () => _addToFavorites(snapshot.data!),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoriteQuotesScreen()),
          );
        },
        child: Icon(Icons.favorite), // Иконка для кнопки перехода на второй экран
      ),
    );
  }
}
