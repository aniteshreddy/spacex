import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:leanix/HomePage/MainlistBuilder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String query = r"""
                    query GetLaunches($offset:Int!){
                        
                          launchesPast(limit: 15,offset:$offset) {
                            mission_name
                            launch_date_local
                            launch_site {
                              site_name_long
                            }
                            links {
                              article_link
                              video_link
                            }
                            rocket {
                              rocket_name
                                  first_stage {
                                    cores {
                                      core {
                                        reuse_count
                                        status
                                      }
                                    }
                                  }
                            }
                            ships {
                              name
                              home_port
                              image
                            }
                          }
                        }
                    
                  """;
  List oldPosts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
              padding: EdgeInsets.only(left: 6),
              child: Icon(CupertinoIcons.rocket,size: 35,)),
          backgroundColor: Colors.blueGrey.shade900,
          title: Text(
            "SpaceX",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: CustomShapeBorder(),
        ),
        body: Query(
            options:
                QueryOptions(document: gql(query), variables: {"offset": 0}),
            builder: (QueryResult result,
                {Future<QueryResult> Function() refetch, FetchMore fetchMore}) {

             

              if (result.data == null) {
                return Text("No Data Found !");
              }

              return HomePageListView(
                result: result,
                fetchMore: fetchMore,
              );
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
