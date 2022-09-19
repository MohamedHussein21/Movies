import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/error/server_excption.dart';
import 'package:movies/movies/domain/entities/movie.dart';

import '../../domain/repository/base_movie_repostory.dart';
import '../data_source/remot_data_source.dart';

class MoviesRepository extends BaseMovieRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);


  @override
  Future<Either<Failure,List<Movie>>> getPlayingNow()async {
   final result= await baseRemoteDataSource.getPlayingNowMovies();

   try{
    return right(result);
   }on ServerException catch(failure){
    return left(FailureServer(massage: failure.errorModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies()async {
    final result= await baseRemoteDataSource.getPopularMovies();

    try{
      return right(result);
    }on ServerException catch(failure){
      return left(FailureServer(massage: failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result= await baseRemoteDataSource.getTopRatedMovies();

    try{
      return right(result);
    }on ServerException catch(failure){
      return left(FailureServer(massage: failure.errorModel.statusMessage));
    }
  }



}