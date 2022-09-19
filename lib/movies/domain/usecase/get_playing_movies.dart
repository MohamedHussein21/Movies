import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repostory.dart';

import '../../../core/error/failure.dart';

class GetPlayingNowUseCase {
 final BaseMovieRepository baseMovieRepository;

  GetPlayingNowUseCase(this.baseMovieRepository);

 Future<Either<Failure,List<Movie>>> call()async {
return await baseMovieRepository.getPlayingNow();
  }
}