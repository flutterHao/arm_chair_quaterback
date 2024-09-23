///
///@auther gejiahui
///created at 2024/9/21/16:18

enum RankType {
  ///竞猜排行榜
  newsGuess(value: "news_guess_rank"),

  ///专家排行榜
  newsGuessExpert(value: "news_guess_Expert_rank");

  const RankType({required this.value});
  final String value;
}
