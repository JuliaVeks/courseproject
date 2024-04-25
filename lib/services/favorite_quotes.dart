
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteQuotes {
  static const _key = 'favorite_quotes';

  static Future<List<String>> getFavoriteQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> toggleFavorite(String quote) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteQuotes();
    if (favorites.contains(quote)) {
      favorites.remove(quote);
    } else {
      favorites.add(quote);
    }
    await prefs.setStringList(_key, favorites);
  }
}
