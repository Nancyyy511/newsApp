import 'package:dio/dio.dart';

sealed class ErrorModel {
  final String message;
  final int? errorCode;

  ErrorModel({required this.message, this.errorCode});

  static ErrorModel errorHandler(Exception error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return TypeParseError(errorMessage: error.toString());
    }
  }

  static ErrorModel _handleDioError(DioException e) {
    // Extract specific status codes
    final statusCode = e.response?.statusCode;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.transformTimeout:
        return NetworkError(
          errorMessage: 'No network connection or request timed out.',
          errorCode: statusCode,
        );

      case DioExceptionType.badResponse:
        if (statusCode == 401) {
          return AuthError(errorMessage: e.response?.data['message'] ?? '');
        } else if (statusCode == 404) {
          return RequestError();
        } else {
          return ServerError();
        }

      case DioExceptionType.cancel:
        return GeneralError();
      default:
        return GeneralError();
    }
  }
}

class GeneralError extends ErrorModel {
  GeneralError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? 'Something went wrong!');
}

class AuthError extends ErrorModel {
  AuthError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? 'Authentication error.');
}

class TypeParseError extends ErrorModel {
  TypeParseError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? 'Error parsing data!');
}

class NetworkError extends ErrorModel {
  NetworkError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? 'No network connection.');
}

class RequestError extends ErrorModel {
  RequestError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? 'something went wrong while connecting.');
}

class ServerError extends ErrorModel {
  ServerError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? 'server error ');
}
