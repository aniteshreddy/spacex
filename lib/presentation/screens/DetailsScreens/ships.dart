import 'package:flutter/material.dart';
import 'package:leanix/data/models/launchModel.dart';
import 'package:leanix/presentation/screens/DetailsScreens/links.dart';
import 'package:leanix/presentation/screens/components/widgets.dart';

class ShipsMain extends StatelessWidget {
  final List<Ship> item;

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
  final Ship item,
) {
  return Column(children: <Widget>[
    shipLayout(item.name.toString(), "Name"),
    shipLayout(item.homePort.toString(), "Home Port"),
    shipLayout(item.image.toString(), "Image"),
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
