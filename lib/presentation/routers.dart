import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:leanix/constants/constants.dart';
import 'package:leanix/cubit/getdata_cubit.dart';
import 'package:leanix/data/client.dart';
import 'package:leanix/data/models/launchModel.dart';
import 'package:leanix/data/repository.dart';
import 'package:leanix/presentation/screens/DetailsScreens/detailScreenMain.dart';
import 'package:leanix/presentation/screens/HomePage/HomePage.dart';

GraphQLClient _client = client.value;
Repository postRepository = Repository(
  client: _client,
);

class AppRouter {
  GetdataCubit getdataCubit;

  AppRouter() {
    getdataCubit = GetdataCubit(postRepository: postRepository)
      ..emit(GetDataLoading());
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getdataCubit,
              ),
              
            ],
            child: HomePage(),
          ),
        );
       case detailScreen:
          final data = settings.arguments as LaunchData;
          return MaterialPageRoute(builder: (_)=>DetailScreen(item:data));
      default:
        return null;
    }
  }
}
