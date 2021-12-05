import 'package:all_projects/view/dummy_page/firstTab.dart';
import 'package:all_projects/view/dummy_page/secondTab.dart';
import 'package:all_projects/view/dummy_page/thirdTab.dart';
import 'package:flutter/material.dart';



class BottomNavDemo extends StatefulWidget {
  @override
  _HomeScreenPage createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<BottomNavDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  String title = "Home";

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            accentColor: Colors.red),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: new Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
          ),
          body: TabBarView(
            children: <Widget>[
              FirstTab(),
              SecondTab(),
              ThirdTab(),

            ],
// if you want yo disable swiping in tab the use below code
//            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
          ),
          bottomNavigationBar: Material(
            color: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TabBar(
              onTap: (indedx) {
                if (indedx == 0) {
                  setState(() {
                    title = "Home";
                  });
                } else if (indedx == 1) {
                  setState(() {
                    title = "Tab Two";
                  });
                } else if (indedx == 2) {
                  setState(() {
                    title = "Tab Three";
                  });
                }
              },
              indicator: BoxDecoration(
                color: const Color(0xff7c94b6),
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  color: Colors.greenAccent,
                  width: 1,
                ),
              ),
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.favorite_border),
                  text: "ONE",
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: "TWO",
                ),
                Tab(
                  icon: Icon(Icons.add_box),
                  text: "THREE",
                ),
              ],
              controller: tabController,
            ),
          ),
        ));
  }
}