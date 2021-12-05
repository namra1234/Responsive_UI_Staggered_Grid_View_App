import 'dart:async';

import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab>
    with SingleTickerProviderStateMixin {
  TabController tabController;
var temp="page1";

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
        var _duartion = new Duration(
      seconds: 4,
    );
    Timer(_duartion, () async {
      setState(() {
        temp="After timer";
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

Widget mainPage(BuildContext context)
{
  

  

return Container(child: Center(child: Text(temp)));
}

Widget secondPage()
{

return Container(child: Center(child: Text("Page 2")),);
}

Widget thirdPage()
{

return Container(child: Center(child: Text("Page 3")),);
}

  @override
  Widget build(BuildContext context) {
     
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            height: 50.0,
            child: new TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: [
                Tab(
                  text: "ONE",
                ),
                Tab(
                  text: "TWO2222222222222222",
                ),
                Tab(
                  text: "THREE",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Text("TAB One CONTENT"),
            Text("TAB TWO CONTENT"),
            Text("TAB THREE CONTENT"),
          ],
        ),
      ),
    );
  }
}