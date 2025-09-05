import 'package:big_app/common/widgets/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';


class LoginDio{
    final Dio _dio = Dio();

    Future<Response> login(String username, String password) async {

      final String url = "${Constants.apiUrl}/auth/login";

      final Map<String, dynamic> userData = {
          Constants.apiUsernameField: username,
          Constants.apiPasswordField: password,
      };
      try {
          final response = await _dio.post(
                url,
                data: userData,
                options: Options(
                headers: {"Content-Type": "application/json"},),
              );
            if (response.statusCode == Constants.loginSuccess) {

              // Strore token
              final responseData = response.data;
              final String token = responseData['accessToken'];
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('jwt_token', token);

              return response;
            } else {
                throw Exception(Constants.loginErrorMessage);
            }
        } catch (e) {
            rethrow;
        }
    }
}