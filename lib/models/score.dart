class Score {
  final int levelId;
  final double time;

  Score({required this.levelId, required this.time});

  Map toJson() => {'levelId': levelId, 'time': time};

  factory Score.fromJson(Map json) {
    return Score(levelId: json['levelId'], time: json['time']);
  }
}
