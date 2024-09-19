import 'nba_team_rank.dart';

class TeamRank {
  List<NbaTeamRank>? nbaTeamRanks;

  TeamRank({this.nbaTeamRanks});

  factory TeamRank.fromJson(Map<String, dynamic> json) => TeamRank(
        nbaTeamRanks: (json['NBATeamRanks'] as List<dynamic>?)
            ?.map((e) => NbaTeamRank.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'NBATeamRanks': nbaTeamRanks?.map((e) => e.toJson()).toList(),
      };
}
