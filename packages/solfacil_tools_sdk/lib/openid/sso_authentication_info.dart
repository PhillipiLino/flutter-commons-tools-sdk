import 'package:equatable/equatable.dart';

class SSOAuthenticationInfo extends Equatable {
  final String accessToken;
  final String idToken;

  const SSOAuthenticationInfo(
    this.accessToken,
    this.idToken,
  );

  @override
  List<Object?> get props => [
        accessToken,
        idToken,
      ];
}
