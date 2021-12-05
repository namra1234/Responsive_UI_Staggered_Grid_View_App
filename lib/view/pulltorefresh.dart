import 'package:flutter/material.dart';

class PullToRefresh extends StatefulWidget {
  @override
  _PullToRefreshState createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
// ScaffoldKey object. This is required
// to show snackbar
// This is optional. This is not requred always
  GlobalKey<ScaffoldState> _scaffoldKey;

// Local State to display items in listview
  List<String> _demoData;

// This method will run once widget is loaded
// i.e when widget is mounting
  @override
  void initState() {
    // initializing states
    _demoData = [
      "Flutter",
      "React Native",
      "Cordova/ PhoneGap",
      "Native Script"
    ];
    _scaffoldKey = GlobalKey();
    super.initState();
  }

// This method will run when widget is unmounting
  @override
  void dispose() {
    // disposing states
    _scaffoldKey?.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('PULL TO REFRESH'),
        ),
        // Widget to show RefreshIndicator
        body: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              // List Item
              return Card(
                child: ListTile(
                  title: Text(_demoData[idx]),
                ),
              );
            },

            // Length of the list
            itemCount: _demoData.length,

            // To make listView scrollable
            // even if there is only a single item.
            physics: const AlwaysScrollableScrollPhysics(),
          ),
          // Function that will be called when
          // user pulls the ListView downward
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 1),
                  () {
                /// adding elements in list after [1 seconds] delay
                /// to mimic network call
                ///
                /// Remember: [setState] is necessary so that
                /// build method will run again otherwise
                /// list will not show all elements
                setState(() {
                  _demoData.addAll(["Ionic", "Xamarin"]);
                });

                // showing snackbar
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: const Text('Page Refreshed'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}