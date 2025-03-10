import 'package:hive/hive.dart';
import 'favorite_model.dart';

class FavoriteService {
  static const String _boxName = 'favorites';

  Future<Box<FavoriteModel>> _openBox() async {
    return await Hive.openBox<FavoriteModel>(_boxName);
  }

  Future<void> toggleFavorite(String coinId) async {
    final box = await _openBox();

    if (box.containsKey(coinId)) {
      await box.delete(coinId);
    } else {
      await box.put(coinId, FavoriteModel(id: coinId));
    }
  }

  Future<List<FavoriteModel>> getFavorites() async {
    final box = await _openBox();
    return box.values.toList();
  }

  bool isFavorite(String coinId) {
    return Hive.box<FavoriteModel>(_boxName).containsKey(coinId);
  }
}
