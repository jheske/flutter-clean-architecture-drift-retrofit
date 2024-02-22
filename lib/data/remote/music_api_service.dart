/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
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
