import 'package:flutter/material.dart';
import 'package:leanix/components/widgets.dart';

class RocketMain extends StatelessWidget {
  final item;

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
              cardWidget(item, "Rocket name", "rocket_name"),
              cardWidget1(item, "Reuse count", "reuse_count"),
              cardWidget1(item, "Status", "status"),
            ])));
  }
}

Widget cardWidget(final item, String sub, String name) {
  return Row(
    children: <Widget>[
      Text(
        sub,
        style: textstyle,
      ),
      Spacer(),
      Text(item[name],style: textstyle,)
    ],
  );
}

Widget cardWidget1(final item, String sub, String name) {
  print(item[name]);
  return Row(
    children: <Widget>[
      Text(
        sub,
        style: textstyle,
      ),
      Spacer(),
      Text(item["first_stage"]["cores"][0]["core"][name].toString(),style: textstyle,)
    ],
  );
}
