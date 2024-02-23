import 'package:expense_tracker/bar_graph/individual.dart';

class BarData {
  final int sundayExp;
  final int mondayExp;
  final int tuesdayExp;
  final int wednesdayExp;
  final int thursdayExp;
  final int fridayExp;
  final int saturdayExp;

  BarData({
    required this.sundayExp,
    required this.mondayExp,
    required this.tuesdayExp,
    required this.wednesdayExp,
    required this.thursdayExp,
    required this.fridayExp,
    required this.saturdayExp,
  });

  List<IndividualBar> barData = [];

  void intializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sundayExp),
      IndividualBar(x: 1, y: mondayExp),
      IndividualBar(x: 2, y: tuesdayExp),
      IndividualBar(x: 3, y: wednesdayExp),
      IndividualBar(x: 4, y: thursdayExp),
      IndividualBar(x: 5, y: fridayExp),
      IndividualBar(x: 6, y: saturdayExp),
    ];
  }
}
