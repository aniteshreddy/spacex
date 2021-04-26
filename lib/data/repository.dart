import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:leanix/constants/constants.dart';
import 'package:leanix/data/models/launchModel.dart';

class Repository {
  final GraphQLClient client;

  Repository({
    @required this.client,
  });

  Future<List<LaunchData>> getPosts(int length) async {
    final results = await client.query(
      QueryOptions(document: gql(query), variables: {"offset": length}),
    );
    // print(results.data["launchesPast"].toString());
    if (results.hasException) {
      throw results.exception;
    } else {

      final launchesData = results.data["launchesPast"]
          .map((i) => new LaunchData.fromJson(i))
          .toList();
      final List<LaunchData> launches = List<LaunchData>.from(launchesData);
      return launches;
    }
  }
}
