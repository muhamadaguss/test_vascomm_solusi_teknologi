import 'package:test_vascomm/api/api_client.dart';
import 'package:test_vascomm/api/api_response.dart';
import 'package:test_vascomm/api/service_url.dart';
import 'package:test_vascomm/injection_container.dart';

import '../models/login_model.dart';

class RemoteDataSource {
  final ApiClient apiClient = sl<ApiClient>();

  //post
  Future<ApiResponse<LoginResponseModel>> login(
      Map<String, dynamic> loginModel) async {
    final response = await apiClient.post(ServiceUrl.login, data: loginModel);
    return ApiResponse.fromJson(response, LoginResponseModel.fromJson);
  }

  //put

  //get
}
