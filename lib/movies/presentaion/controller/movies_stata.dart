import 'package:equatable/equatable.dart';
import 'package:movies/core/ulitis/enum.dart';

import '../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMassage;
  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMassage;
  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMassage;

  const MoviesStates({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMassage = '',
    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMassage = '',
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMassage = '',
  });

  MoviesStates copyWith({
     List<Movie>? nowPlayingMovie,
     RequestState? nowPlayingState,
     String? nowPlayingMassage,
     List<Movie>? popularMovie,
     RequestState? popularState,
     String? popularMassage,
     List<Movie>? topRatedMovie,
     RequestState? topRatedState,
     String? topRatedMassage,
}){
    return MoviesStates(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMassage: nowPlayingMassage ??this.nowPlayingMassage,
      popularMovie: popularMovie ??this.popularMovie,
      popularState: popularState ?? this.popularState,
      popularMassage: popularMassage ?? this.popularMassage,
      topRatedMovie: topRatedMovie ?? this.popularMovie,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMassage: topRatedMassage ?? this.topRatedMassage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMassage,
        popularMovie,
        popularState,
        popularMassage,
        topRatedState,
        topRatedState,
        topRatedMassage
      ];
}
