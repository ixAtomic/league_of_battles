import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:league_of_battles/models/user/user_models.dart';

class User {
  String userId = "";
  UserResponseModel userResponseModel = UserResponseModel();
  User();
  User.fromUserId(this.userId);

  Future<User> getUser(String userId) async {
    //var user = User.fromUserId(userId);
    this.userId = userId;
    await _init();
    return this;
  }

  Future<void> _init() async {
    final response = await http.get(Uri.parse(dotenv.env['LAMBDA_URL']!)
        .replace(
            queryParameters: {'id': 'e93bac52-bc99-11ed-afa1-0242ac120002'}));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, parse the JSON.
      userResponseModel = UserResponseModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an error.
      throw Exception('Failed to user');
    }
  }
}
