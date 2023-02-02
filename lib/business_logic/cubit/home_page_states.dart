import 'package:appgain/business_logic/cubit/home_page_cubit.dart';

abstract class HomePageStates {}

class HomePageInitialState extends HomePageStates {}

class GetPopularMovieLoadingState extends HomePageStates {}

class GetPopularMovieSuccessState extends HomePageStates {}

class GetPopularMovieFailureState extends HomePageStates {
  final String error;

  GetPopularMovieFailureState({required this.error});
}
class PageChangedSuccess extends HomePageStates{}

//========================================================================================================================================
class GetMovieDetailsLoadingState extends HomePageStates {}

class GetMovieDetailsSuccessState extends HomePageStates {}

class GetMovieDetailsFailureState extends HomePageStates {
  final String error;

  GetMovieDetailsFailureState({required this.error});
}
