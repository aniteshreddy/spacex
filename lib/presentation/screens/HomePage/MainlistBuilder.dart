import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:leanix/cubit/getdata_cubit.dart';
import 'package:leanix/data/models/launchModel.dart';
import 'package:leanix/presentation/screens/HomePage/mainListDesign.dart';

class HomePageListView extends StatelessWidget {
  final List<LaunchData> launchData;

  static List oldPosts = [];

  const HomePageListView({Key key, @required this.launchData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    oldPosts += launchData;
    return Container(
        padding: EdgeInsets.only(top: 10, left: 8),
        child: LazyLoadScrollView(
            scrollOffset: 500,
            onEndOfPage: () {
              BlocProvider.of<GetdataCubit>(context).fetchData(oldPosts.length);
            },
            child: Scrollbar(
                child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                print(oldPosts[index]);
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
