import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/widgets/YearScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar:AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          actions: [],
          title:const Text("Expanses"),
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child:  Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Container(
                          width: size.width,
                          child: TabBar(
                            indicatorColor: Colors.transparent,
                            isScrollable: true,
                            labelStyle:
                            GoogleFonts.lato(
                              color: Color(0xFF57636C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            unselectedLabelStyle:
                            GoogleFonts.lato(
                              color: Color(0xFF57636C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor:
                            Color(0xFF57636C),

                            labelPadding:
                            EdgeInsetsDirectional.fromSTEB(
                                20, 0, 20, 0),

                            padding:
                            EdgeInsetsDirectional.fromSTEB(
                                0, 0, 16, 0),
                            tabs: [
                              SizedBox(
                                width:size.width*0.3,
                                child: Tab(
                                  text: 'Week',

                                ),),
                              SizedBox(
                                width:size.width*0.3,
                                child: Tab(
                                  text: 'Month',

                                ),),
                              SizedBox(
                                width:size.width*0.3,
                                child: Tab(
                                  text: 'Year',

                                ),),

                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              YearScreen(),
                              YearScreen(),
                              YearScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

