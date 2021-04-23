import 'dart:convert';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);

    return user;
  }

  Future<List<QuizModel>> getQuizzers() async {
    final response =
        await rootBundle.loadString("assets/database/quizzers.json");
    final list = jsonDecode(response) as List;
    final quizzers = list.map((e) => QuizModel.fromMap(e)).toList();

    return quizzers;
  }
}
