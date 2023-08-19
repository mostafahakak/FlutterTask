import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:untitled1/Models/DummyModel.dart';
import 'package:untitled1/widgets/ItemsCard.dart';

import '../Charts/PieChart.dart';
import '../Models/DataModel.dart';

class YearScreen  extends StatefulWidget{

  const YearScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _YearScreen();
}

class _YearScreen extends State<YearScreen> {
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
    return FutureBuilder<DataModel>(
      future: GetDummyData("",index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("");
        } else if (snapshot.hasError) {
          return Text('Error fetching data: ${snapshot.error}');
        } else if (snapshot.hasData) {
          var amountData = snapshot.data!;
          int totalAmount =  amountData.shoppingAmount + amountData.wellnessAmount + amountData.transportAmount+ amountData.barsAmount+amountData.subAmount;
          return  ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 10,),
              HomePie(totalNumberSpent: totalAmount,
                shoppingAmount:(amountData.shoppingAmount*100)/totalAmount,
                wellnessAmount: (amountData.wellnessAmount*100)/totalAmount,
                transportAmount: (amountData.transportAmount*100)/totalAmount,
                barsAmount: (amountData.barsAmount*100)/totalAmount,
                subAmount: (amountData.subAmount*100)/totalAmount,

              ),
              SizedBox(height: 10,),
              Container(
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
              ),
              SizedBox(height: 10,),

              CardItems(iconDat: Icons.shopping_bag_outlined,name: "Shopping",percantage: (amountData.shoppingAmount*100)/totalAmount,totalPrice:  amountData.shoppingAmount,transactions: amountData.shoppingTransactions, cardColor: Color(0xffc0c0de),),
              SizedBox(height: 10,),
              CardItems(iconDat: Icons.heart_broken,name: "Wellness",percantage:(amountData.wellnessAmount*100)/totalAmount,totalPrice: amountData.wellnessAmount,transactions: amountData.wellnessTransactions, cardColor: Color(0xff9fd2c0),),
              SizedBox(height: 10,),
              CardItems(iconDat: Icons.airplanemode_active,name: "Transport",percantage: (amountData.transportAmount*100)/totalAmount,totalPrice: amountData.transportAmount,transactions: amountData.transportTransactions, cardColor: Color(0xffffb0b6),),
              SizedBox(height: 10,),
              CardItems(iconDat: Icons.local_pizza_outlined,name: "Bars & Restaurants",percantage: (amountData.barsAmount*100)/totalAmount,totalPrice: amountData.barsAmount,transactions: amountData.barsTransactions, cardColor: Color(0xff8e9bc5),),
              SizedBox(height: 10,),
              CardItems(iconDat: Icons.subscriptions_outlined,name: "Subscriptions",percantage: (amountData.subAmount*100)/totalAmount,totalPrice: amountData.subAmount,transactions: amountData.subTransactions, cardColor: Color(0xffffc2a5),),
              SizedBox(height: 10,),

            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Future<DataModel> GetDummyData(String type,int month) async{

    int shoppingTransactions = 0;
    int shoppingAmount = 0;

    int wellnessTransactions = 0;
    int wellnessAmount = 0;

    int transportTransactions = 0;
    int transportAmount = 0;

    int barsTransactions = 0;
    int barsAmount = 0;

    int subTransactions = 0;
    int subAmount = 0;


    List<DummyModel> dummyData = [
      DummyModel(id: "Shopping",price:100,month: 0),
      DummyModel(id: "Shopping",price:200,month: 0),
      DummyModel(id: "Shopping",price:10,month: 0),
      DummyModel(id: "Shopping",price:20,month: 0),
      DummyModel(id: "Shopping",price:40,month: 1),
      DummyModel(id: "Shopping",price:20,month: 3),
      DummyModel(id: "Shopping",price:50,month: 4),
      DummyModel(id: "Shopping",price:200,month: 5),
      DummyModel(id: "Shopping",price:200,month: 8),
      DummyModel(id: "Shopping",price:200,month: 9),
      DummyModel(id: "Shopping",price:200,month: 10),

      DummyModel(id: "Wellness",price:200,month: 3),
      DummyModel(id: "Wellness",price:200,month: 3),
      DummyModel(id: "Wellness",price:200,month: 11),
      DummyModel(id: "Wellness",price:200,month: 7),
      DummyModel(id: "Wellness",price:200,month: 11),
      DummyModel(id: "Wellness",price:200,month: 4),
      DummyModel(id: "Wellness",price:200,month: 10),

      DummyModel(id: "Transport",price:200,month: 3),
      DummyModel(id: "Transport",price:200,month: 3),
      DummyModel(id: "Transport",price:200,month: 11),
      DummyModel(id: "Transport",price:200,month: 6),
      DummyModel(id: "Transport",price:200,month: 4),
      DummyModel(id: "Transport",price:200,month: 10),

      DummyModel(id: "Bars & Restaurants",price:50,month: 3),
      DummyModel(id: "Bars & Restaurants",price:50,month: 3),
      DummyModel(id: "Bars & Restaurants",price:100,month: 5),
      DummyModel(id: "Bars & Restaurants",price:200,month: 11),
      DummyModel(id: "Bars & Restaurants",price:200,month: 4),
      DummyModel(id: "Bars & Restaurants",price:200,month: 10),

      DummyModel(id: "Subscriptions",price:200,month: 3),
      DummyModel(id: "Subscriptions",price:300,month: 2),
      DummyModel(id: "Subscriptions",price:100,month: 11),
      DummyModel(id: "Subscriptions",price:100,month: 11),
      DummyModel(id: "Subscriptions",price:100,month: 4),
      DummyModel(id: "Subscriptions",price:100,month: 10),

    ];

    for(int i =0;i<dummyData.length;i++){
      if(dummyData[i].id=="Shopping" && dummyData[i].month==month ){
        shoppingTransactions++;
        shoppingAmount = shoppingAmount+dummyData[i].price;
      }
      else if (dummyData[i].id=="Wellness" && dummyData[i].month==month){
        wellnessTransactions++;
        wellnessAmount = wellnessAmount+dummyData[i].price;
      }
      else if (dummyData[i].id=="Transport" && dummyData[i].month==month){
        transportTransactions++;
        transportAmount = transportAmount+dummyData[i].price;
      }
      else if (dummyData[i].id=="Bars & Restaurants" && dummyData[i].month==month){
        barsTransactions++;
        barsAmount = barsAmount+dummyData[i].price;
      }
      else if (dummyData[i].id=="Subscriptions" && dummyData[i].month==month){
        subTransactions++;
        subAmount = subAmount+dummyData[i].price;
      }
      else{

      }
    }

    return DataModel(shoppingTransactions: shoppingTransactions, shoppingAmount: shoppingAmount, wellnessTransactions: wellnessTransactions, wellnessAmount: wellnessAmount, transportAmount: transportAmount, transportTransactions: transportTransactions, barsTransactions: barsTransactions, barsAmount: barsAmount, subTransactions: subTransactions, subAmount: subAmount);
  }
}