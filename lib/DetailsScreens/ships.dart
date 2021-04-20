import 'package:flutter/material.dart';
import 'package:leanix/components/widgets.dart';
import 'package:leanix/DetailsScreens/links.dart';

class ShipsMain extends StatelessWidget {
  final item;

  const ShipsMain({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 8,
        ),
        width: double.infinity,
        child: Card(
          elevation: 8,
            color: Colors.blueGrey.shade800,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(width: 1, color: Colors.white)),
            child: Column(children: <Widget>[
              heading("Ship Details"),
              Container(
                  padding:
                      EdgeInsets.only(left: 6, right: 8, top: 10, bottom: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) {
                        return shipCardList(item[index]);
                      }))
            ])));
  }
}

Widget shipCardList(
  final item,
) {
  return Column(children: <Widget>[
    shipLayout(item["name"].toString(), "Name"),
    shipLayout(item["home_port"].toString(), "Home Port"),
    shipLayout(item["image"].toString(), "Image"),
    SizedBox(height: 15),
    Divider(color: Colors.white)
  ]);
}

Widget shipLayout(String item, String sub) {
  return Row(
    children: <Widget>[
      Text(
        sub,
        style: textstyle,
      ),
      Spacer(),
      InkWell(
        
          onTap: () {
            if (sub == "Image") {
              launchURL(item);
            }
          },
          child: Text(
            
            item,
            style: textstyle.copyWith(
                color: sub == "Image" ? Colors.blue : Colors.white),
          ))
    ],
  );
}
