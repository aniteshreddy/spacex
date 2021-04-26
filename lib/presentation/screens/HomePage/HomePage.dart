import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leanix/cubit/getdata_cubit.dart';
import 'package:leanix/presentation/screens/HomePage/MainlistBuilder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  BlocProvider.of<GetdataCubit>(context).fetchData(0);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                CupertinoIcons.rocket,
                size: 35,
              )),
          backgroundColor: Colors.blueGrey.shade900,
          title: Text(
            "SpaceX",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: CustomShapeBorder(),
        ),
        body:
            BlocBuilder<GetdataCubit, GetdataState>(builder: (context, state) {
          if (state is GetDataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetDataLoaded) {
            return HomePageListView(
              launchData: state.posts,
            );
          }
          print(state);
          return Center(child: Text("error"));
        }));
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path path = Path();
    path.lineTo(0, rect.height + 40);
    path.conicTo(0, rect.height, rect.width / 6, rect.height, 1.5);
    path.lineTo(rect.width - (rect.width / 6), rect.height);
    path.conicTo(rect.width, rect.height, rect.width, rect.height + 40, 1.5);
    path.lineTo(rect.width, 0);
    path.close();

    return path;
  }
}
