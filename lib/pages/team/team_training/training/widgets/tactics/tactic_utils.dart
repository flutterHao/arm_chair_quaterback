import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';

class TacticUtils {
  static List<int> matchedIndices = [];

  static String checkTacticMatch(List<TrainingInfoBuff> tacticList) {
    if (tacticList.isEmpty) {
      // 如果没有牌，不构成任何牌型
      for (var buff in tacticList) {
        buff.isMatch = false;
      }
      return "";
    }

    // 按照牌面大小排序
    // tacticList.sort((a, b) => a.face.compareTo(b.face));
    matchedIndices.clear();
    // 检查皇家同花顺
    if (isRoyalFlush(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Royal Flush";
    }

    // 检查同花顺
    if (isStraightFlush(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Straight Flush";
    }

    // 检查四条
    if (isFourOfAKind(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Four of a Kind";
    }

    // 检查葫芦
    if (isFullHouse(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Full House";
    }

    // 检查同花
    if (isFlush(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Flush";
    }

    // 检查顺子
    if (isStraight(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Straight";
    }

    // 检查三条
    if (isThreeOfAKind(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Three of a Kind";
    }

    // 检查两对
    if (isTwoPair(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "Two Pair";
    }

    // 检查一对
    if (isOnePair(tacticList, matchedIndices)) {
      setMatchForIndices(tacticList, matchedIndices);
      return "One Pair";
    }

    // 如果没有匹配任何牌型
    setMatchForIndices(tacticList, []);
    return "No Match";
  }

  static void setMatchForIndices(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    for (int i = 0; i < tacticList.length; i++) {
      tacticList[i].isMatch = matchedIndices.contains(i);
    }
  }

  static bool isRoyalFlush(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    if (!isFlush(tacticList, matchedIndices)) return false;
    for (int i = 0; i <= tacticList.length - 5; i++) {
      if (tacticList[i].face == 10 &&
          tacticList[i + 1].face == 11 &&
          tacticList[i + 2].face == 12 &&
          tacticList[i + 3].face == 13 &&
          tacticList[i + 4].face == 14) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3, i + 4]);
        return true;
      }
    }
    return false;
  }

  static bool isStraightFlush(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    if (!isFlush(tacticList, matchedIndices)) return false;
    for (int i = 0; i <= tacticList.length - 5; i++) {
      if (isStraight(tacticList.sublist(i, i + 5), matchedIndices)) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3, i + 4]);
        return true;
      }
    }
    return false;
  }

  static bool isFourOfAKind(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    for (int i = 0; i <= tacticList.length - 4; i++) {
      if (tacticList[i].face == tacticList[i + 1].face &&
          tacticList[i + 1].face == tacticList[i + 2].face &&
          tacticList[i + 2].face == tacticList[i + 3].face) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3]);
        return true;
      }
    }
    return false;
  }

  static bool isFullHouse(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    for (int i = 0; i <= tacticList.length - 5; i++) {
      if (tacticList[i].face == tacticList[i + 1].face &&
          tacticList[i + 1].face == tacticList[i + 2].face &&
          tacticList[i + 3].face == tacticList[i + 4].face) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3, i + 4]);
        return true;
      }
      if (tacticList[i].face == tacticList[i + 1].face &&
          tacticList[i + 2].face == tacticList[i + 3].face &&
          tacticList[i + 3].face == tacticList[i + 4].face) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3, i + 4]);
        return true;
      }
    }
    return false;
  }

  static bool isFlush(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    for (int i = 0; i <= tacticList.length - 5; i++) {
      if (tacticList[i].color == tacticList[i + 1].color &&
          tacticList[i + 1].color == tacticList[i + 2].color &&
          tacticList[i + 2].color == tacticList[i + 3].color &&
          tacticList[i + 3].color == tacticList[i + 4].color) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3, i + 4]);
        return true;
      }
    }
    return false;
  }

  static bool isStraight(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    if (tacticList.length < 5) {
      return false;
    }

    // 检查普通的顺子
    for (int i = 0; i <= tacticList.length - 5; i++) {
      bool isContinuous = true;
      for (int j = i; j < i + 4; j++) {
        if (tacticList[j + 1].face - tacticList[j].face != 1) {
          isContinuous = false;
          break;
        }
      }
      if (isContinuous) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3, i + 4]);
        return true;
      }
    }

    return false;
  }

  static bool isThreeOfAKind(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    for (int i = 0; i <= tacticList.length - 3; i++) {
      if (tacticList[i].face == tacticList[i + 1].face &&
          tacticList[i + 1].face == tacticList[i + 2].face) {
        matchedIndices.addAll([i, i + 1, i + 2]);
        return true;
      }
    }
    return false;
  }

  static bool isTwoPair(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    for (int i = 0; i <= tacticList.length - 2; i++) {
      if (i + 3 < tacticList.length &&
          tacticList[i].face == tacticList[i + 1].face &&
          tacticList[i + 2].face == tacticList[i + 3].face) {
        matchedIndices.addAll([i, i + 1, i + 2, i + 3]);
        return true;
      }
      if (i + 4 < tacticList.length &&
          tacticList[i].face == tacticList[i + 1].face &&
          tacticList[i + 3].face == tacticList[i + 4].face) {
        matchedIndices.addAll([i, i + 1, i + 3, i + 4]);
        return true;
      }
      if (i + 4 < tacticList.length &&
          tacticList[i + 1].face == tacticList[i + 2].face &&
          tacticList[i + 3].face == tacticList[i + 4].face) {
        matchedIndices.addAll([i + 1, i + 2, i + 3, i + 4]);
        return true;
      }
    }
    return false;
  }

  static bool isOnePair(
      List<TrainingInfoBuff> tacticList, List<int> matchedIndices) {
    for (int i = 0; i <= tacticList.length - 2; i++) {
      if (tacticList[i].face == tacticList[i + 1].face) {
        matchedIndices.addAll([i, i + 1]);
        return true;
      }
    }
    return false;
  }
}
