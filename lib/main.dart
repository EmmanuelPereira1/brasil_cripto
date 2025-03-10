import 'package:brasil_cripto/core/local_storage/favorite_model.dart';
import 'package:brasil_cripto/my_material_app.dart';
import 'package:brasil_cripto/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future <void> main() async {
  await dotenv.load(
    fileName: ".env"
  );
  AppGetIt().setupProviders();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>('favorites');
  runApp(const MyMaterialApp());
}

