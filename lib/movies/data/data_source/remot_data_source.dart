import 'package:dio/dio.dart';
import 'package:movies/core/error/server_excption.dart';
import 'package:movies/core/network/error_Model.dart';
import 'package:movies/core/ulitis/constant.dart';
import 'package:movies/movies/data/model/movies_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<MoviesModel>> getPlayingNowMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<MoviesModel>> getPlayingNowMovies() async {
    final response = await Dio().get(AppConstant.playingNowPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromjson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async{
    final response = await Dio().get(AppConstant.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromjson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies()async {
    final response = await Dio().get(AppConstant.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromjson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
