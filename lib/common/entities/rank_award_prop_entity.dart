import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';

///
///@auther gejiahui
///created at 2024/9/25/14:28

class RankAwardPropEntity {
  final RankAwardEntity rankAwardEntity;
  final List<PropDefineNumEntity> awardPickData;

  RankAwardPropEntity(this.rankAwardEntity, this.awardPickData);
}

class PropDefineNumEntity {
  final int num;
  final PropDefineEntity propDefineEntity;

  PropDefineNumEntity(this.num, this.propDefineEntity);
}
