import 'package:big_app/common/widgets/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoDio{
    final Dio _dio = Dio();

    Future<Map<String, dynamic>?> getUser(String username) async {

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');

      final String url = "${Constants.apiUrl}/auth/me";

      if (token == null) return null;

      try {
          final response = await _dio.get(
                url,
                options: Options(
                headers: {"Authorization": "Bearer $token"},),
              );
            if (response.statusCode == 200) {
              return response.data;
            } else {
                throw Exception(Constants.loginErrorMessage);
            }
        } catch (e) {
            rethrow;
        }
    }
}