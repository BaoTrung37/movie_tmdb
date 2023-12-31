import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_session_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GuestSessionResponse {
  GuestSessionResponse({
    required this.success,
    required this.guestSessionId,
    required this.expiresAt,
  });

  factory GuestSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$GuestSessionResponseFromJson(json);
  final bool success;
  final String guestSessionId;
  final String expiresAt;

  Map<String, dynamic> toJson() => _$GuestSessionResponseToJson(this);
}
