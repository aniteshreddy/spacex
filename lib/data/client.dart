import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(
 "https://api.spacex.land/graphql/",
);

final Link _link = _httpLink;

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: _link,
  ),
);
