import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:queens/models/score.dart';

class ScoreService {
  final storage = Hive.box("storage");

  dynamic get scores {
    if (!storage.containsKey("scores")) return [];
    var data = storage.get("scores");
    if (data == null) return [];
    return data.map((json) => Score.fromJson(json)).toList();
  }

  void addScore(Score score) {
    var allScores = scores..add(score);
    storage.put("scores", allScores.map((s) => s.toJson()).toList());
  }

  void clearScores() {
    storage.delete("scores");
  }
}
