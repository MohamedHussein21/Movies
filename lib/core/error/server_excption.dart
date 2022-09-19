import 'package:movies/core/network/error_Model.dart';

class ServerException implements Exception {

  final ErrorModel errorModel;

  const ServerException({required this.errorModel});

}

class LocalDataBaseException implements Exception{

  final String massage;

  const LocalDataBaseException({required this.massage});
}