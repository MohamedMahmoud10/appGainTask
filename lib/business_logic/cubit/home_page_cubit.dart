import 'dart:developer';

import 'package:appgain/data/Network/Remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/movie_details.dart';
import '../../Data/models/popular_movies.dart';
import '../../Utils/helpers_fun.dart';
import 'home_page_states.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitialState());

  static HomePageCubit get(context) => BlocProvider.of(context);
  PopularMoviesModel? popularMovies;
  int currentPage = 1;

  Future<void> getAllMovies() async {
    emit(GetPopularMovieLoadingState());
    await DioHelper.getAllMovies(currentPage).then((value) async {
      popularMovies = PopularMoviesModel.fromJson(value.data);
      printMessage(
          '=========================================================================');
      printMessage('TheMovieDataIs ${value.data}');
      printMessage(
          '=========================================================================');
      emit(GetPopularMovieSuccessState());
    });
  }

  void onPageChanged(int numberPage) {
    currentPage = numberPage;
    emit(PageChangedSuccess());
  }

  //========================================================================================================================================
  MovieDetailsModel? movieDetailsModel;

  // void getMovieDetails(int id) {
  //   emit(GetMovieDetailsLoadingState());
  //   DioHelper.getMovieDetails(id: id).then((value) {
  //     movieDetails = MovieDetails.fromJson(value.data);
  //     printMessage('=========================================================================');
  //     printMessage('Movie Details Data Is ${value.data}');
  //     printMessage('=========================================================================');
  //   }).catchError((error) {
  //     printMessage(error.toString());
  //     emit(GetMovieDetailsFailureState(error: error.toString()));
  //   });
  // }

  Future<void> getMovieDetails({required int id}) async {
    emit(GetMovieDetailsLoadingState());
    await DioHelper.getMovieDetails(id: id).then((value) async {
      movieDetailsModel = MovieDetailsModel.fromJson(value.data);
      printMessage(
          '=========================================================================');
      printMessage('Movie Details Data Is ${value.data}');
      printMessage(
          '=========================================================================');
    }).catchError((error) {
      printMessage(error.toString());
      emit(GetMovieDetailsFailureState(error: error.toString()));
    });
  }
}
