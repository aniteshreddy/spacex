import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:leanix/HomePage/HomePage.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MaterialApp(
    title: "Spacex App",
    home: MyApp(),
   
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink("https://api.spacex.land/graphql/");
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
      child: HomePage(),
      client: client,
    );
  }
}
