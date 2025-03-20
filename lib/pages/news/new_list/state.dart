/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 19:00:39
 * @LastEditTime: 2024-12-11 10:14:23
 */
import 'dart:ui';

import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_banner.dart';

import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';

class NewListState {
  // // title
  // final _title = "".obs;
  // set title(value) => _title.value = value;
  // get title => _title.value;

  NewsListEntity newsEntity = NewsListEntity();
  List<NewsBanner> banners = [];
  NewsListDetail newsDetail = NewsListDetail();
  List<StarsTeamRank> starTeamList = [];
  List<TeamRankEntity> teamRankList = [];
  List<NbaPlayerStat> statsList = [];
  List<NbaTeamEntity> teamConfigList = [];
  Map<int, List<TeamRankEntity>> teamMap = {};

  Map<String, List<NbaPlayerStat>> statsRankMap = {};

  PropDefineEntity propDefineEntity = PropDefineEntity();
  NewListState() {
    ///Initialize variables
  }

  List<NewsListDetail> newsFlowList = [];
  int page = 0;
  int pageSize = 5;
  List<NewsListDetail> detailList = [];

  // Map<int, Map<String, Color>> teamColorMap = {
  //   114: {"light": AppColors.c008348, "dart": AppColors.c000000},
  //   128: {"light": AppColors.c595959, "dart": AppColors.c000000},
  //   109: {"light": AppColors.c00438C, "dart": AppColors.c000000},
  //   120: {"light": AppColors.c003DA6, "dart": AppColors.c000000},
  //   129: {"light": AppColors.cBD1B21, "dart": AppColors.c000000},
  //   101: {"light": AppColors.c99152F, "dart": AppColors.c000000},
  //   119: {"light": AppColors.c72253D, "dart": AppColors.c000000},
  //   117: {"light": AppColors.c0B336D, "dart": AppColors.c000000},
  //   118: {"light": AppColors.c091F40, "dart": AppColors.c000000},
  //   110: {"light": AppColors.c00471C, "dart": AppColors.c000000},
  //   113: {"light": AppColors.c800A1E, "dart": AppColors.c000000},
  //   116: {"light": AppColors.c00788C, "dart": AppColors.c000000},
  //   107: {"light": AppColors.c961A31, "dart": AppColors.c000000},
  //   108: {"light": AppColors.c00568B, "dart": AppColors.c000000},
  //   130: {"light": AppColors.c0E2240, "dart": AppColors.c000000},
  //   124: {"light": AppColors.c0D2240, "dart": AppColors.c000000},
  //   126: {"light": AppColors.c002D62, "dart": AppColors.c000000},
  //   125: {"light": AppColors.c800E20, "dart": AppColors.c000000},
  //   127: {"light": AppColors.c335787, "dart": AppColors.c000000},
  //   112: {"light": AppColors.c1D428A, "dart": AppColors.c000000},
  //   104: {"light": AppColors.c0B2241, "dart": AppColors.c000000},
  //   105: {"light": AppColors.c552C81, "dart": AppColors.c000000},
  //   123: {"light": AppColors.c873522, "dart": AppColors.c000000},
  //   106: {"light": AppColors.c592C82, "dart": AppColors.c000000},
  //   121: {"light": AppColors.c004880, "dart": AppColors.c000000},
  //   111: {"light": AppColors.c67040C, "dart": AppColors.c000000},
  //   103: {"light": AppColors.c2F4A80, "dart": AppColors.c000000},
  //   122: {"light": AppColors.c1D4374, "dart": AppColors.c000000},
  //   102: {"light": AppColors.c4D4D4D, "dart": AppColors.c000000},
  //   115: {"light": AppColors.c002B5C, "dart": AppColors.c000000},
  // };
}
