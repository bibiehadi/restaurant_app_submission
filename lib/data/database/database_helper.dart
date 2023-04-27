import 'package:restaurant_app_submission/data/model/list_restaurant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static late Database _database;
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableName = 'favorite_restaurant';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'favorite_restaurant.db'),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableName (
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        pictureId TEXT,
        city TEXT,
        rating DOUBLE
      )''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertFavRestaurant(RestaurantTile restaurant) async {
    final Database db = await database;
    await db.insert(_tableName, restaurant.toJson());
    print('Data Saved');
  }

  Future<List<RestaurantTile>> getFavRestauran() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((e) => RestaurantTile.fromJson(e)).toList();
  }

  Future<RestaurantTile> getFavById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    return result.map((e) => RestaurantTile.fromJson(e)).first;
  }

  Future<void> delFav(String id) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
