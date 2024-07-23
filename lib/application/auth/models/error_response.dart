import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  factory ErrorResponse({
    required String type,
    required String title,
    required int status,
    required String detail,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
