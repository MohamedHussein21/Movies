import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies/core/ulitis/enum.dart';
import 'package:movies/movies/domain/usecase/get_playing_movies.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_Movies.dart';
import 'package:movies/movies/presentaion/controller/movies_event.dart';
import 'package:movies/movies/presentaion/controller/movies_stata.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetPlayingNowUseCase getPlayingNowUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetToRatedUseCase getToRatedUseCase;

  MoviesBloc(this.getPlayingNowUseCase, this.getPopularMoviesUseCase,
      this.getToRatedUseCase)
      : super(const MoviesStates()) {
    on<MoviePlayingNowEvent>(_getPlayingNowMovies);

    on<PopularMoviesEvent>(_getPopularMovies);

    on<TopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getPlayingNowMovies(
      MoviePlayingNowEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPlayingNowUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMassage: l.massage)),
        (r) => emit(state.copyWith(
            nowPlayingMovie: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      PopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMassage: l.massage)),
        (r) => emit(state.copyWith(
            popularMovie: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      TopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getToRatedUseCase();

    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMassage: l.massage)),
        (r) => emit(state.copyWith(
            topRatedMovie: r, topRatedState: RequestState.loaded)));
  }
}
