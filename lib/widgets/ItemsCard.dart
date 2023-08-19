import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

class CardItems  extends StatefulWidget{
  final Color cardColor;
  final String name;
  final int transactions;
  final double percantage;
  final int totalPrice;
  final IconData iconDat;
  const CardItems({
    super.key,
    required this.cardColor,
    required this.name,
    required this.transactions,
    required this.percantage,
    required this.totalPrice,
    required this.iconDat,

  });

  @override
  State<StatefulWidget> createState() => _CardItems();
}

class _CardItems extends State<CardItems> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
    child: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 15,),

              Icon(widget.iconDat,size: 30,),
              SizedBox(width: 25,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                  SizedBox(height: 3,),
                  Text("${widget.transactions.toString()} Transactions",),
                ],
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Column(
                children: [
                  Text("\$${ intl.NumberFormat.decimalPattern().format(widget.totalPrice).toString()}",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600),),
                  SizedBox(height: 6,),
                  Text(widget.percantage.toString().length>4
                      ?"${widget.percantage.toString().substring(0, 5)}%"
                      :"${widget.percantage.toString()}%",style: GoogleFonts.lato(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.grey),),
                ],
              ),
              Spacer(),

            ],
          ),
        ),
        Container(
          color: widget.cardColor.withOpacity(0.5) ,
          width: (MediaQuery.of(context).size.width *widget.percantage)/100, // here you can define your percentage of progress, 0.2 = 20%, 0.3 = 30 % .....
          height: 60,
        ),
      ],
    ),);
  }
}