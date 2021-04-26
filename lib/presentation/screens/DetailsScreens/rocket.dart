import 'package:flutter/material.dart';
import 'package:leanix/data/models/launchModel.dart';
import 'package:leanix/presentation/screens/components/widgets.dart';

class RocketMain extends StatelessWidget {
  final Rocket item;

  const RocketMain({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
        color: Colors.blueGrey.shade800,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(width: 1, color: Colors.white)),
        child: Container(
            padding: EdgeInsets.all(8),
            child: Column(children: <Widget>[
              heading("Rocket Details"),
              cardWidget(item, "Rocket name"),
              cardWidget1( "Reuse count", item.firstStage.cores[0].core.reuseCount.toString()),
              cardWidget1("Status",item.firstStage.cores[0].core.status.toString()),
            ])));

  }
}

Widget cardWidget(Rocket item, String sub) {
  return Row(
    children: <Widget>[
      Text(
        sub,
        style: textstyle,
      ),
      Spacer(),
      Text(item.rocketName,style: textstyle,)
    ],
  );
}

Widget cardWidget1( String sub, String name) {
  return Row(
    children: <Widget>[
      Text(
        sub,
        style: textstyle,
      ),
      Spacer(),
      Text(name,style: textstyle,)
    ],
  );
}
