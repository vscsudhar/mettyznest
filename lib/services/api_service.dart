import 'package:dio/dio.dart';
import 'package:mettyznest/core/model/create_response_model.dart';
import 'package:mettyznest/core/model/get_pet_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService init() {
    final dio = Dio();
    dio.options.baseUrl = 'https://www.mettyznest.com/api/';

    dio.interceptors.add(PrettyDioLogger(requestBody: true));

    return ApiService(dio);
  }

  @POST('register/form')
  Future<CreateResponse> createDetails({
    @Body() required FormData formData,
  });

  @GET('get/form')
  Future<GetPetResponse> getDetails();
}
