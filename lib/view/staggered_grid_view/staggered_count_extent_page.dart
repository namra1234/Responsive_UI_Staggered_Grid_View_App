import 'package:all_projects/model/ImgHeadingDes.dart';
import 'package:all_projects/view/staggered_grid_view/staggered_grid_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredCountExtentPage extends StatefulWidget {
  @override
  _StaggeredCountExtentPageState createState() =>
      _StaggeredCountExtentPageState();
}

class _StaggeredCountExtentPageState extends State<StaggeredCountExtentPage> {
  bool  state = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10000; i++) {
      if (i == 9999) {
        state = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    List<StaggeredTile> _tiles = <StaggeredTile>[
      //  StaggeredTile.extent(1, 50.0),
      StaggeredTile.extent(1, MediaQuery.of(context).size.height / 2.5),
      StaggeredTile.extent(1, MediaQuery.of(context).size.height / 2.2 + 90),
      StaggeredTile.extent(1, MediaQuery.of(context).size.height /  2.2 + 90),
      StaggeredTile.extent(1, MediaQuery.of(context).size.height /  2.2 + 90),


    ];

    List<ImgHeadingDes> imgHeadingDescription = [];

    imgHeadingDescription.add(ImgHeadingDes(
        name: "Technology1",
        description: "I like to learn new technology and update myself.",
        image:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"));
    imgHeadingDescription.add(ImgHeadingDes(
        name: "Technology2",
        description: "I like to learn new technology and update myself.",
        image:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"));
    imgHeadingDescription.add(ImgHeadingDes(
        name: "Technology3",
        description: "I like to learn new technology and update myself.",
        image:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"));
    imgHeadingDescription.add(ImgHeadingDes(
        name: "Technology1",
        description: "I like to learn new technology and update myself.",
        image:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"));


    List<String> _tilesData = <String>["Hi", "Hello", "How are you", "?"];

    return state
        ? StaggeredGridViewPage.count(
            title: 'Staggered (Count, Extent)',
            crossAxisCount: 2,
            tiles: _tiles,
            imgHeadingDescription: imgHeadingDescription,
          )
        : Text("Getting Data");
  }
}
