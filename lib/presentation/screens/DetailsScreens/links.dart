import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leanix/data/models/launchModel.dart';
import 'package:leanix/presentation/screens/components/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkMain extends StatelessWidget {
  final Links item;

  const LinkMain({Key key, this.item}) : super(key: key);
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
            child: Container(
                padding:
                    EdgeInsets.only(left: 6, right: 8, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    heading("Websites"),
                    SizedBox(
                      height: 10,
                    ),
                    links(item.articleLink, "Article Link"),
                    item.articleLink != null
                        ? SizedBox(
                            height: 15,
                          )
                        : SizedBox(),
                    links(item.videoLink, "Video Link")
                  ],
                ))));
  }
}

Widget links(String name, String sub) {
  return name != null
      ? RichText(
          text: TextSpan(
          children: [
            TextSpan(style: textstyle, text: "$sub: "),
            TextSpan(
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  letterSpacing: 1,
                  color: Colors.blue,
                  height: 1.5, fontSize: (14),

                  //fontWeight: FontWeight.bold,
                ),
                text: name,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchURL(name)),
          ],
        ))
      : SizedBox();
}

launchURL(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Could not launch $link';
  }
}
