import 'nba_player_stat.dart';

class StatsRank {
  List<NbaPlayerStat>? nbaPlayerStats;

  StatsRank({this.nbaPlayerStats});

  factory StatsRank.fromJson(Map<String, dynamic> json) => StatsRank(
        nbaPlayerStats: (json['rowSet'] as List<dynamic>?)
            ?.map((e) => NbaPlayerStat.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'rowSet': nbaPlayerStats?.map((e) => e.toJson()).toList(),
      };
}
