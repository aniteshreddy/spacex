import 'package:flutter/material.dart';
import 'package:leanix/constants/constants.dart';
import 'package:leanix/data/models/launchModel.dart';
import 'package:leanix/presentation/screens/DetailsScreens/detailScreenMain.dart';

class SpaceListItem extends StatelessWidget {
 final LaunchData item;
  final animation;

  const SpaceListItem({Key key, this.item, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blueGrey.shade800,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(width: 1, color: Colors.white)),
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: item.ships.length != 0
                  ? item.ships[0].image != null
                      ? NetworkImage(item.ships[0].image, scale: 1)
                      : AssetImage("assets/images/spacex.jpg")
                  : AssetImage("assets/images/spacex.jpg"),
              radius: 35.0,
              child: Container(
                  decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              )),
            ),
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          title: Text(item.missionName,
              style: TextStyle(fontSize: 17, color: Colors.white)),
          
          subtitle: Text(item.rocket.rocketName.toString(),
              style: TextStyle(fontSize: 12, color: Colors.white)),
          onTap: () {
            Navigator.pushNamed(context,detailScreen  ,arguments: item);
          },
        ));
  }
}
