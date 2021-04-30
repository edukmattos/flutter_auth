import '../enums/response_status_enum.dart';

class DefaultResponse<T> {
  final T object;
  final String message;
  final ResponseStatus status;

  bool get success => status == ResponseStatus.rsSuccess;
  bool get failed => status == ResponseStatus.rsFailed;

  DefaultResponse({
    required this.object,
    required this.message,
    required this.status,
  });
}
