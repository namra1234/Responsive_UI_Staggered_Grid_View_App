import 'package:all_projects/model/ImgHeadingDes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class TileWidget extends StatelessWidget {
  const TileWidget(
      {Key key, @required this.index, this.backgroundColor: Colors.green,this.imgHeadingDes})
      : super(key: key);

  final int index;
  final ImgHeadingDes imgHeadingDes;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return index==1 ? Padding(
      padding: EdgeInsets.only(top:90),
      child: GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: Image.network(
                          imgHeadingDes.image,
                          width: 280.0,
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(imgHeadingDes.name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Divider(color: Colors.black)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(imgHeadingDes.description,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300)),
                          ),
                          Divider(color: Colors.black)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    ),
    ) : Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: Image.network(
                        imgHeadingDes.image,
                        width: 280.0,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(imgHeadingDes.name,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Divider(color: Colors.black)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(imgHeadingDes.description,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300)),
                        ),
                        Divider(color: Colors.black)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
