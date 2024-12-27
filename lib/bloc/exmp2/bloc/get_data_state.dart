part of 'get_data_bloc.dart';

@immutable
sealed class GetDataState {}

final class GetDataInitial extends GetDataState {}

// ignore: must_be_immutable
class OnSuccessState extends GetDataState {
  List userData = [];
  OnSuccessState({required this.userData});
}

class OnLoadingState extends GetDataState {}

// ignore: must_be_immutable
class OnErrorState extends GetDataState {
  late String message;
  OnErrorState({required this.message});
}
