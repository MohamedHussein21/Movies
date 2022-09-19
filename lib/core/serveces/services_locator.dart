import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/data_source/remot_data_source.dart';
import 'package:movies/movies/data/repository/movies_repositpory.dart';
import 'package:movies/movies/domain/repository/base_movie_repostory.dart';
import 'package:movies/movies/domain/usecase/get_playing_movies.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_Movies.dart';
import 'package:movies/movies/presentaion/controller/movies_bloc.dart';

GetIt sL = GetIt.instance;
class ServicesLocator {

  void init(){
    ///Movie Bloc
    sL.registerFactory(() => MoviesBloc(sL(),sL(),sL()));

    ///use cases
    sL.registerLazySingleton(() => GetPlayingNowUseCase(sL()));
    sL.registerLazySingleton(() => GetPopularMoviesUseCase(sL()));
    sL.registerLazySingleton(() => GetToRatedUseCase(sL()));

    /// Repository
    sL.registerLazySingleton<BaseMovieRepository>(() =>MoviesRepository(sL()) );

    ///Data Source
    sL.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}