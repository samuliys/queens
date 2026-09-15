import 'package:get/get.dart';
import 'package:queens/config/level_data.dart';
import 'package:queens/services/score_service.dart';
import 'package:queens/models/score.dart';

class ScoreController {
  final service = Get.find<ScoreService>();

  RxList scores;

  ScoreController() : scores = [].obs {
    scores.value = service.scores;
  }

  void reset() {
    service.clearScores();
    scores.clear();
  }

  void addScore(int levelId, double time) {
    final score = Score(levelId: levelId, time: time);
    service.addScore(score);
    scores.add(score);
  }

  Set<int> get completedLevels => scores.map((s) => s.levelId as int).toSet();

  bool get allLevelsCompleted => completedLevels.length == gameLevels.length;

  double get totalPlayTime => scores.fold(0, (sum, s) => sum + s.time);

  int get totalPlays => scores.length;

  double get averageTime => scores.isEmpty ? 0 : totalPlayTime / scores.length;

  double get fastestTime => scores.isEmpty
      ? 0
      : scores.map((s) => s.time).reduce((a, b) => a < b ? a : b);

  double get slowestTime => scores.isEmpty
      ? 0
      : scores.map((s) => s.time).reduce((a, b) => a > b ? a : b);

  int get highestCompletedLevel => completedLevels.isEmpty
      ? 0
      : completedLevels.reduce((a, b) => a > b ? a : b);

  Map<int, int> get playCounts {
    final Map<int, int> counts = {};
    for (var score in scores) {
      counts[score.levelId] = (counts[score.levelId] ?? 0) + 1;
    }
    return counts;
  }

  Map<int, double> get bestTimes {
    final Map<int, double> bestTimes = {};
    for (var score in scores) {
      if (!bestTimes.containsKey(score.levelId) ||
          score.time < bestTimes[score.levelId]!) {
        bestTimes[score.levelId] = score.time;
      }
    }
    return bestTimes;
  }
}
