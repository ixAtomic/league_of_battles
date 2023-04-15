class UserResponseModel {
  UserModel? user = UserModel();
  List<TeamsModel>? teams = <TeamsModel>[];
  StatisticsWithAggregateModel? stats = StatisticsWithAggregateModel();
  StatisticsWithAggregateModel? oneDayStats = StatisticsWithAggregateModel();
  StatisticsWithAggregateModel? sevenDayStats = StatisticsWithAggregateModel();

  UserResponseModel(
      {this.user,
      this.stats,
      this.teams,
      this.oneDayStats,
      this.sevenDayStats});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    user = UserModel.fromJson(json['user']);
    stats = StatisticsWithAggregateModel.fromJson(json['stats']);
    teams = List<TeamsModel>.from((json['teams'] as List)
        .map((teamJson) => TeamsModel.fromJson(teamJson)));
    oneDayStats = StatisticsWithAggregateModel.fromJson(json['one_day_stats']);
    sevenDayStats =
        StatisticsWithAggregateModel.fromJson(json['seven_day_stats']);
  }
}

class UserModel {
  String? userName;
  List<String>? teams;
  String? lastName;
  String? email;
  String? firstName;
  Map<String, dynamic>? statistics;
  String? riotPuuid;

  UserModel(
      {this.userName,
      this.teams,
      this.lastName,
      this.email,
      this.firstName,
      this.statistics,
      this.riotPuuid});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    teams = List<String>.from(json['teams']);
    lastName = json['last_name'];
    email = json['email'];
    firstName = json['first_name'];
    statistics = json['statistics'];
    riotPuuid = json['riot_puuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['teams'] = teams;
    data['last_name'] = lastName;
    data['email'] = email;
    data['first_name'] = firstName;
    data['statistics'] = statistics;
    data['riot_puuid'] = riotPuuid;
    return data;
  }
}

class TeamsModel {
  TeamModel? team = TeamModel();
  List<MatchModel>? matches = <MatchModel>[];

  TeamsModel.fromJson(Map<String, dynamic> json) {
    team = TeamModel.fromJson(json['team']);
    matches = List<MatchModel>.from((json['matches'] as List)
        .map((matchJson) => MatchModel.fromJson(matchJson)));
  }
}

class MatchModel {
  String? id;
  String? matchDate;
  String? winningTeam;
  List<String>? teams;

  MatchModel({
    this.id,
    this.matchDate,
    this.winningTeam,
    this.teams,
  });

  MatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchDate = json['match_date'];
    winningTeam = json['winning_team'];
    teams = List<String>.from(json['teams']);
  }
}

class TeamModel {
  String? id;
  int? currentStreak;
  int? highestStreak;
  int? loss;
  int? wins;
  String? teamType;
  String? teamName;
  int? position;
  List<String>? players;

  TeamModel({
    this.id,
    this.currentStreak,
    this.highestStreak,
    this.loss,
    this.wins,
    this.teamType,
    this.teamName,
    this.position,
    this.players,
  });

  String getTeamType(int teamType) {
    switch (teamType) {
      case 1:
        return '1v1';
      case 2:
        return '2v2';
      case 3:
        return '3v3';
      case 4:
        return '4v4';
      case 5:
        return '5v5';
    }
    return '';
  }

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currentStreak = json['current_streak'];
    highestStreak = json['highest_streak'];
    loss = json['loss'];
    wins = json['wins'];
    teamType = getTeamType(json['team_type']);
    teamName = json['team_name'];
    position = json['position'];
    players = List<String>.from(json['players']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['current_streak'] = currentStreak;
    data['highest_streak'] = highestStreak;
    data['loss'] = loss;
    data['wins'] = wins;
    data['team_type'] = teamType;
    data['team_name'] = teamName;
    data['position'] = position;
    data['players'] = players;
    return data;
  }
}

class StatisticsWithAggregateModel {
  Map<String, int?> statMap = {};
  StatisticsWithAggregateModel();

  String getCurrentKeyName(int index, bool partialName) {
    List<String> keys = statMap.keys.toList();
    String key = keys[index];
    List<String> parts = key.split('_');
    if (partialName) return parts.last;
    return parts.join(' ');
  }

  String getCurrentValue(int index) {
    List<int?> values = statMap.values.toList();
    return values[index] != null ? values[index].toString() : '';
  }

  StatisticsWithAggregateModel.fromJson(Map<String, dynamic> json) {
    statMap['Total_Damage'] = json['total_damage'];
    statMap['Total_Earnings'] = json['total_earnings'];
    statMap['Total_Kills'] = json['total_kills'];
    statMap['Total_Wins'] = json['total_wins'];
    statMap['Total_Losses'] = json['total_losses'];
  }
}
