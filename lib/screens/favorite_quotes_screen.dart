import 'package:flutter/material.dart';
import '../services/favorite_quotes.dart';

class FavoriteQuotesScreen extends StatefulWidget {
  @override
  _FavoriteQuotesScreenState createState() => _FavoriteQuotesScreenState();
}

class _FavoriteQuotesScreenState extends State<FavoriteQuotesScreen> {
  List<String> favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteQuotes();
  }

  Future<void> _loadFavoriteQuotes() async {
    final quotes = await FavoriteQuotes.getFavoriteQuotes();
    setState(() {
      favoriteQuotes = quotes;
    });
  }

  Future<void> _removeFromFavorites(String quote) async {
    await FavoriteQuotes.toggleFavorite(quote);
    await _loadFavoriteQuotes(); // Перезагрузим список избранных цитат после изменения
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранные цитаты'),
      ),
      body: ListView.separated(
        itemCount: favoriteQuotes.length,
        separatorBuilder: (context, index) => Divider(color: Colors.purple, height: 2),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteQuotes[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Удалить цитату из избранных?'),
                      content: Text('Вы уверены, что хотите удалить эту цитату из списка избранных?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Отмена'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Закрыть диалоговое окно без удаления
                          },
                        ),
                        TextButton(
                          child: Text('Удалить'),
                          onPressed: () async {
                            await _removeFromFavorites(favoriteQuotes[index]);
                            Navigator.of(context).pop(); // Закрыть диалоговое окно после удаления
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
