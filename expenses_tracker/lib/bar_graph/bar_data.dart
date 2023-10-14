import 'package:expenses_tracker/bar_graph/individual_bar.dart';

class BarData{
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  BarData({
  required this.sunAmount,
  required this.monAmount,
  required this.tueAmount,
  required this.wedAmount,
  required this.thuAmount,
  required this.friAmount,
  required this.satAmount
  });
  List<IndividualBar> barData = [];


  void initializeBarData(){
    barData = [
      IndividualBar(x: 0, amount: sunAmount),
      IndividualBar(x: 1, amount: monAmount),
      IndividualBar(x: 2, amount: tueAmount),
      IndividualBar(x: 3, amount: wedAmount),
      IndividualBar(x: 4, amount: thuAmount),
      IndividualBar(x: 5, amount: friAmount),
      IndividualBar(x: 6, amount: satAmount)
    ];
  }
}