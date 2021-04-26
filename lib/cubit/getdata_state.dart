part of 'getdata_cubit.dart';

@immutable
abstract class GetdataState {}



class GetdataInitial extends GetdataState {}

class GetDataLoading extends GetdataState {}


class GetDataLoaded extends GetdataState {
  final List<LaunchData> posts;

  GetDataLoaded({this.posts});
}

class GetDataError extends GetdataState{

}