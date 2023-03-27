import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        // TODO: Handle this case.
        return ServerFailure(errMessage: "Request to server was cancelled");
      case DioErrorType.connectionTimeout:
        // TODO: Handle this case.
        return ServerFailure(errMessage: "Connection timeout with server");
      case DioErrorType.receiveTimeout:
        // TODO: Handle this case.
        return ServerFailure(
            errMessage: "Receive timeout in connection with server");
      case DioErrorType.sendTimeout:
        // TODO: Handle this case.
        return ServerFailure(
            errMessage: "Send timeout in connection with server");
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        return ServerFailure(
            errMessage: "Bad certificate in connection with server");
      case DioErrorType.badResponse:
        // TODO: Handle this case.
        return ServerFailure.fromResponse(
            statusCode: dioError.response!.statusCode,
            response: dioError.response!.data);
      case DioErrorType.connectionError:
        // TODO: Handle this case.
        return ServerFailure(errMessage: "Connection error with server");
      case DioErrorType.unknown:
        // TODO: Handle this case.
        return ServerFailure(errMessage: "Unknown error occurred");
      default:
        return ServerFailure(
            errMessage:
                "Oops, Unexpected error occurred, Please try again later");
    }
  }

  factory ServerFailure.fromResponse(
      {required int? statusCode, required dynamic response}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 409) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request was not found, Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal Server Error, Please try again later');
    } else {
      return ServerFailure(
          errMessage:
              'Oops, Unexpected error occurred, Please try again later');
    }
  }
}
