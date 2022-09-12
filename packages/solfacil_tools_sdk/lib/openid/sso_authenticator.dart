import 'package:flutter_appauth/flutter_appauth.dart';

import 'sso_authentication_info.dart';

class SSOAuthenticator {
  final FlutterAppAuth appAuth = const FlutterAppAuth();

  Future<SSOAuthenticationInfo?> doLogin(
    String clientId,
    String redirectUrl,
    String discoveryUrl,
  ) async {
    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        clientId,
        redirectUrl,
        discoveryUrl: discoveryUrl,
        scopes: ['openid'],
      ),
    );

    final accessToken = result?.accessToken ?? '';
    final idToken = result?.idToken ?? 'undefined';
    return SSOAuthenticationInfo(accessToken, idToken);
  }

  Future doLogout(
    String idToken,
    String redirectUrl,
    String discoveryUrl,
  ) async {
    return await appAuth.endSession(
      EndSessionRequest(
        idTokenHint: idToken,
        postLogoutRedirectUrl: redirectUrl,
        discoveryUrl: discoveryUrl,
      ),
    );
  }
}
