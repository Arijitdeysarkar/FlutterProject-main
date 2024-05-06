abstract class BasicApiService{
  Future<dynamic> getApiResponse(String url,dynamic header);
  Future<dynamic> postApiResponse(String url,dynamic method,dynamic body);
}