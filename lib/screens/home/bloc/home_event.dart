part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

// ignore: must_be_immutable
class NextImageEvent extends HomeEvent {
  int index;

  NextImageEvent({this.index});
  List<Object> get props => [index];
}

// ignore: must_be_immutable
class BuyProductEvent extends HomeEvent {
  bool presssedBuy;
  BuyProductEvent({this.presssedBuy});
  List<Object> get props => [presssedBuy];
}

class RefreshEvent extends HomeEvent {
  List<Object> get props => [];
}
