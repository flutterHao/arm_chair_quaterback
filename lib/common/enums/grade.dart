///
///@auther gejiahui
///created at 2024/10/21/14:24

enum Grade {
  dDown(name: "D-", value: 0,grade: 0),
  d(name: "D", value: 1,grade: 0),
  dUP(name: "D+", value: 2,grade: 0),
  cDown(name: "C-", value: 3,grade: 1),
  c(name: "C", value: 4,grade: 1),
  cUP(name: "C+", value: 5,grade: 1),
  bDown(name: "B-", value: 6,grade: 2),
  b(name: "B", value: 7,grade: 2),
  bUP(name: "B+", value: 8,grade: 2),
  aDown(name: "A-", value: 9,grade: 3),
  a(name: "A", value: 10,grade: 3),
  aUP(name: "A+", value: 11,grade: 3),
  sDown(name: "S-", value: 12,grade: 4),
  s(name: "S", value: 13,grade: 4),
  sUP(name: "S+", value: 14,grade: 4),
  ssDown(name: "SS-", value: 15,grade: 5),
  ss(name: "SS", value: 16,grade: 5),
  ssUP(name: "SS+", value: 17,grade: 5);

  final String name;
  final int value;
  final int grade;

  const Grade({this.name = "", this.value = -1,this.grade = -1});

  static Grade getGradeByName(String name) {
    if (name == "D-") {
      return Grade.dDown;
    }
    if (name == "D") {
      return Grade.d;
    }
    if (name == "D+") {
      return Grade.dUP;
    }
    if (name == "C-") {
      return Grade.cDown;
    }
    if (name == "C") {
      return Grade.c;
    }
    if (name == "C+") {
      return Grade.cUP;
    }
    if (name == "B-") {
      return Grade.bDown;
    }
    if (name == "B") {
      return Grade.b;
    }
    if (name == "B+") {
      return Grade.bUP;
    }
    if (name == "A-") {
      return Grade.aDown;
    }
    if (name == "A") {
      return Grade.a;
    }
    if (name == "A+") {
      return Grade.aUP;
    }
    if (name == "S-") {
      return Grade.sDown;
    }
    if (name == "S") {
      return Grade.s;
    }
    if (name == "S+") {
      return Grade.sUP;
    }
    if (name == "SS-") {
      return Grade.ssDown;
    }
    if (name == "SS") {
      return Grade.ss;
    }
    if (name == "SS+") {
      return Grade.ssUP;
    }
    return ssUP;
  }

  static Grade getGradeByValue(int value) {
    if (value == 0) {
      return Grade.dDown;
    }
    if (value == 1) {
      return Grade.d;
    }
    if (value == 2) {
      return Grade.dUP;
    }
    if (value == 3) {
      return Grade.cDown;
    }
    if (value == 4) {
      return Grade.c;
    }
    if (value == 5) {
      return Grade.cUP;
    }
    if (value == 6) {
      return Grade.bDown;
    }
    if (value == 7) {
      return Grade.b;
    }
    if (value == 8) {
      return Grade.bUP;
    }
    if (value == 9) {
      return Grade.aDown;
    }
    if (value == 10) {
      return Grade.a;
    }
    if (value == 11) {
      return Grade.aUP;
    }
    if (value == 12) {
      return Grade.sDown;
    }
    if (value == 13) {
      return Grade.s;
    }
    if (value == 14) {
      return Grade.sUP;
    }
    if (value == 15) {
      return Grade.ssDown;
    }
    if (value == 16) {
      return Grade.ss;
    }
    if (value == 17) {
      return Grade.ssUP;
    }
    return ssUP;
  }

  Grade getNextGrade() {
    var nextValue = value + 1;
    return getGradeByValue(nextValue);
  }

}
