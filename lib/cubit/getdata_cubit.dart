import 'package:bloc/bloc.dart';
import 'package:leanix/data/models/launchModel.dart';
import 'package:leanix/data/repository.dart';
import 'package:meta/meta.dart';

part 'getdata_state.dart';

class GetdataCubit extends Cubit<GetdataState> {
  final Repository postRepository;

  GetdataCubit({
    @required this.postRepository,
  }) : super(GetdataInitial());

  void fetchData(int length) async {
    try {
      final posts = await postRepository.getPosts(length);
      emit(GetDataLoaded(
        posts: posts,
      ));
    } catch (error) {
      print(error.toString());
      emit(GetDataError());
    }
  }
}
