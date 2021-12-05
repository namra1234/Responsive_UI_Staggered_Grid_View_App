import 'package:all_projects/view/staggered_grid_view/staggered_count_extent_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/route_generator.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StaggeredCountExtentPage(),
    );
  }
}

