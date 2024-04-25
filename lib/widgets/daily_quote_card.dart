import 'package:flutter/material.dart';
import '../models/quote.dart';

class DailyQuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback onFavoritePressed; // Добавляем параметр для функции обратного вызова

  const DailyQuoteCard({Key? key, required this.quote, required this.onFavoritePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.0), // Поднять плашку наверх
      child: Card(
        color: Color(0xFFECE6F0), // Цвет фона карточки
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote.text,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                quote.author,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  // Вызываем функцию обратного вызова и добавляем анимацию
                  onFavoritePressed();
                  _animateToFavorite(context);
                },
                borderRadius: BorderRadius.circular(4),
                splashColor: Colors.white.withOpacity(0.5), // Цвет всплеска при нажатии
                hoverColor: Colors.white.withOpacity(0.5), // Цвет ховера
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Добавить в избранное',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Анимация для добавления цитаты в избранное
  void _animateToFavorite(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Цитата добавлена в избранное'),
        duration: Duration(seconds: 1),
        backgroundColor: Theme.of(context).primaryColor, // Цвет фона
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        margin: EdgeInsets.all(16),
      ),
    );
  }
}
