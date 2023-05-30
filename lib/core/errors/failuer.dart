
import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection TimeOut with Api Server');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send TimeOut with Api Server');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive TimeOut with Api Server');

      case DioErrorType.badCertificate:
        return ServerFailure('Incorrect Certificate');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Request to Api Server canceled');

      case DioErrorType.connectionError:
        return ServerFailure('Error Connection To Api Server');

      case DioErrorType.unknown:
        if(dioError.message!.contains('SocketException')){
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error');
      default:
        return ServerFailure('Ops There was an Error Please try again');
    }

  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found, Please try later!');
    } else if (statusCode == 500) {
      ServerFailure('Internal Server Error,try Later');
    }
    return ServerFailure('Ops There was an Error Please try again');
  }
}
