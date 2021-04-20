import 'package:flutter/material.dart';
import 'package:leanix/HomePage/HomePage.dart';
import 'package:leanix/DetailsScreens/links.dart';
import 'package:leanix/DetailsScreens/rocket.dart';
import 'package:leanix/DetailsScreens/ships.dart';

class DetailScreen extends StatelessWidget {
  final item;

  const DetailScreen({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text(
          item["mission_name"],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        centerTitle: true,
        shape: CustomShapeBorder(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: item["ships"].length != 0
                        ? item["ships"][0]["image"] != null
                            ? NetworkImage(item["ships"][0]["image"])
                            : AssetImage("assets/images/spacex.jpg")
                        : AssetImage("assets/images/spacex.jpg"),
                  )),
                ),
                Container(
                    margin: EdgeInsets.only(top: 230),
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(children: <Widget>[
                      RocketMain(item: item["rocket"]),
                      LinkMain(
                        item: item["links"],
                      ),
                    item["ships"].length!=0?  ShipsMain(item: item["ships"],):Container()
                    ]))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
