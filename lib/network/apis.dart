class ApisEndpoints {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

//가장 인기있는 영화
  static const String getMoviePopular = "/popular";

//극장 상영중 영화
  static const String getNowMovie = "/now-playing";

//곧 개봉 영화
  static const String getComingMovie = "/coming-soon";

//영화 세부정보
  static String getMovieDetail(int movieId) {
    return "/movie?id=movieId";
  }
}
