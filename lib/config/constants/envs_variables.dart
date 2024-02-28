import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvsVariables {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'Not key found';
}