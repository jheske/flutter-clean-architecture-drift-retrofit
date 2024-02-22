import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/music_model.dart';

part '.generated/music_api_service.g.dart';

@RestApi(baseUrl: 'https://mocki.io/v1/50e26bd0-27e6-4183-93fc-ca9da2662366')
abstract class MusicApiService {
  factory MusicApiService(Dio dio) = _MusicApiService;

  @GET('')
  Future<HttpResponse<MusicModel>> fetchMusic();
}
