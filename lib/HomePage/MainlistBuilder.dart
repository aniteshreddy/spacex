import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:leanix/HomePage/mainListDesign.dart';

class HomePageListView extends StatelessWidget {
  final QueryResult result;
  final Future<QueryResult> Function(FetchMoreOptions) fetchMore;

  HomePageListView({Key key, this.result, this.fetchMore}) : super(key: key);
  static List oldPosts = [];
  @override
  Widget build(BuildContext context) {
    if (result.isLoading == false && result.data["launchesPast"] != null) {
      oldPosts = oldPosts + result.data["launchesPast"];
    }
    return Container(
        padding: EdgeInsets.only(top: 10, left: 8),
        child: LazyLoadScrollView(
            scrollOffset: 500,
            onEndOfPage: () {
              if (result.isLoading == false && oldPosts.length != 0) {
                fetchMore(FetchMoreOptions(
                    updateQuery: (oldPosts, newPosts) {
                      return newPosts;
                    },
                    variables: {
                      "offset": oldPosts.length + 15,
                    }));
              }
            },
            child: Scrollbar(
                child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return oldPosts.length != 0
                    ? SpaceListItem(
                        item: oldPosts[index],
                      )
                    : Center(child: CircularProgressIndicator());
              },
              itemCount: oldPosts.length ?? 0,
            ))));
  }
}
