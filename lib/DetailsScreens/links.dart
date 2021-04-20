import 'package:flutter/material.dart';
import 'package:leanix/components/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkMain extends StatelessWidget {
  final item;

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
                    links(item, "article_link", "Article Link"),
                    item["article_link"] != null
                        ? SizedBox(
                            height: 15,
                          )
                        : SizedBox(),
                    links(item, "video_link", "Video Link")
                  ],
                ))));
  }
}

launchURL(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Could not launch $link';
  }
}


