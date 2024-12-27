import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  GetDataBloc() : super(GetDataInitial()) {
    on<InitGetDataEvent>((event, emit) async {
      // TODO: implement event handler
      emit(OnLoadingState());

      String url = 'https://jsonplaceholder.typicode.com/comments';

      Dio dio = Dio();

      var response = await dio.get(url);

      if (response.statusCode == 200) {
        emit(OnSuccessState(userData: response.data));
      } else {
        emit(OnErrorState(message: "Something went wrong"));
      }
    });
  }
}
