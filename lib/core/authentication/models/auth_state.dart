import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    User? user,
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticating,
    String? error,
    User? tempUser,
    int? verificationCode,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

  bool isAuthenticated() => user != null;
}