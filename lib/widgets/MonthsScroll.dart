import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthsScroll  extends StatefulWidget{

  const MonthsScroll({
    super.key,


  });

  @override
  State<StatefulWidget> createState() => _MonthsScroll();
}

class _MonthsScroll extends State<MonthsScroll> {

  int index = 0;
  List monthsList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 30,),
          IconButton(onPressed: (){
            setState(() {
              if(index>0){
                index--;
              }
              else{
                index = 11;
              }
            });

          }, icon: Icon(Icons.arrow_back_ios)),
          Spacer(),
          Text(monthsList[index],style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.black),),
          Spacer(),
          IconButton(onPressed: (){
            setState(() {
              if(index<11){
                index++;
              }
              else{
                index = 0;
              }
            });
          }, icon: Icon(Icons.arrow_forward_ios)),
          SizedBox(width: 30,),

        ],
      ),
    );
  }
}