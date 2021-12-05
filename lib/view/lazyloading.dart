import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LazyLoading extends StatefulWidget {
  static int page = 0;

  @override
  _LazyLoadingState createState() => _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> {
  ScrollController _sc = new ScrollController();

  bool isLoading = false;

  List users = new List();

  final dio = new Dio();

  @override
  void initState() {
    this._getMoreData(LazyLoading.page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _getMoreData(LazyLoading.page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lazy Load Large List"),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: users.length + 1, // Add one more item for progress indicator
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (BuildContext context, int index) {
        if (index == users.length) {
          return _buildProgressIndicator();
        } else {
          return new ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                users[index]['picture']['large'],
              ),
            ),
            title: Text((users[index]['name']['first'])),
            subtitle: Text((users[index]['email'])),
          );
        }
      },
      controller: _sc,
    );
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = "https://randomuser.me/api/?page=" +
          index.toString() +
          "&results=20&seed=abc";
      print(url);
      final response = await dio.get(url);
      List tList = new List();
      for (int i = 0; i < response.data['results'].length; i++) {
        tList.add(response.data['results'][i]);
      }

      setState(() {
        isLoading = false;
        users.addAll(tList);
        LazyLoading.page++;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
