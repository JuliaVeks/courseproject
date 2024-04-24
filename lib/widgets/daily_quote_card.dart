import 'package:flutter/material.dart';
import '../models/quote.dart';

class DailyQuoteCard extends StatelessWidget {
  final Quote quote;

  const DailyQuoteCard({Key? key, required this.quote}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {}, // Нет обработчика нажатия
                    child: Text(
                      'Добавить в избранное',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
