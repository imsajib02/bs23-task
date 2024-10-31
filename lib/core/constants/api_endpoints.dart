import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['BASE_URL']!;
final String apiUrl = dotenv.env['API_URL']!;

final String repositoriesUrl = '$apiUrl${dotenv.env['REPOS']!}';