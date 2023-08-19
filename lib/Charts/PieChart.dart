import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePie  extends StatefulWidget{
  final int totalNumberSpent;
  double shoppingAmount;

  double wellnessAmount;

  double transportAmount;

  double barsAmount;

  double subAmount;
   HomePie({
    super.key,
    required this.totalNumberSpent,
    required this.shoppingAmount,
    required this.wellnessAmount,
    required this.transportAmount,
    required this.barsAmount,
    required this.subAmount

  });

  @override
  State<StatefulWidget> createState() => _HomePage2();
}

class _HomePage2 extends State<HomePie> {



  final colorList = <Color>[
    Color(0xffc0c0de),
    Color(0xff9fd2c0),
    Color(0xffffb0b6),
    Color(0xff8e9bc5),
    Color(0xffffc2a5),
  ];

  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                if(show==false){
                  show = true;
                }
                else{
                  show = false;
                }
              });
            },
            child: PieChart(
              dataMap: {
                "shopping": widget.shoppingAmount,
                "wellness": widget.wellnessAmount,
                "transport": widget.transportAmount,
                "bars": widget.barsAmount,
                "subscription": widget.subAmount,
              },
              chartType: ChartType.ring,
              baseChartColor: Colors.grey[50]!.withOpacity(0.15),
              ringStrokeWidth: 5,

              colorList: colorList,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                showLegends: false,

              ),
              chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: show,
                  showChartValues: show,
                  showChartValueBackground: true,
                  showChartValuesOutside: true
              ),
              totalValue: 100,
            ),),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total spent",style: GoogleFonts.lato(fontSize: 12,color: Colors.grey),),
                Text("\$${ intl.NumberFormat.decimalPattern().format(widget.totalNumberSpent)}",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }
}