import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nomad_challenge_final/network/apis.dart';

class MovieService {
  //baseUrl 선언
  final Dio _dio = Dio(BaseOptions(baseUrl: ApisEndpoints.baseUrl));

  //home api

  //인기영화
  Future<List<dynamic>> fetchPopularMovies() async {
    try {
      final response = await _dio.get(ApisEndpoints.getMoviePopular);
      debugPrint("인기있는 영화 : ${response.data['results']}");
      return response.data['results'];
    } catch (e) {
      throw Exception("인기상영작을 불러오지 못하였습니다.");
    }
  }

  //극장상영
  Future<List<dynamic>> fetchNowPlay() async {
    try {
      final response = await _dio.get(ApisEndpoints.getNowMovie);
      debugPrint("극장상영 : ${response.data}");
      return response.data['results'];
    } catch (e) {
      throw Exception("극장 상영을 불러오지 못하였습니다.");
    }
  }

  //곧개봉
  Future<List<dynamic>> fetchComeSoon() async {
    try {
      final response = await _dio.get(ApisEndpoints.getComingMovie);
      debugPrint("곧개봉 : ${response.data}");
      return response.data['results'];
    } catch (e) {
      throw Exception("곧 개봉 영화를 불러오지 못하였습니다.");
    }
  }
}
