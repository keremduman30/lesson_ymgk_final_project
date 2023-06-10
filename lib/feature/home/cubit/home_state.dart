import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<int>? gameList;
  final int subtraction;
  @override
  List<Object?> get props => [isLoading, gameList];

  const HomeState({this.isLoading = false, this.subtraction = 1, this.gameList});
}
