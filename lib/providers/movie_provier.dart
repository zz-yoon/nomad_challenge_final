import 'package:flutter/material.dart';
import 'package:nomad_challenge_final/network/services/movie_service.dart';

class MovieProvider with ChangeNotifier{
  final MovieService _movieService = MovieService();

  //상태관리 데이터
  List<dynamic> _popularMovies = [];
  List<dynamic> _nowPlay = [];
  List<dynamic> _comeSoon = [];
  List<dynamic> get popularMovies => _popularMovies;
  List<dynamic> get nowPlay => _nowPlay;
  List<dynamic> get comeSoon => _comeSoon;

  //로딩상태
  bool _isLoading = false;
  bool get isLoading => _isLoading;

 //home : 인기영화
 Future<void> fetchPopularMovies() async {
   if(_popularMovies.isNotEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      final popular = await _movieService.fetchPopularMovies();
      _popularMovies = popular;
    }catch(e) {
      print("error  allMovies $e");
    }finally {
      _isLoading = false;
      notifyListeners();
    }
 }

 //home : 곧개봉
  Future<void> fetchNowPlay() async {
   if(_nowPlay.isNotEmpty) return;
   _isLoading = true;
   notifyListeners();
   try {
     final nowPlay = await _movieService.fetchNowPlay();
     _nowPlay = nowPlay;
   }catch(e) {
     print("error palyNow $e");
   }finally{
     _isLoading = false;
     notifyListeners();
   }
  }

  //커밍쑨
  Future<void> fetchComeSoon() async {
   if(_comeSoon.isNotEmpty) return;
   _isLoading = true;
   notifyListeners();
   try {
     final comeSoon = await _movieService.fetchComeSoon();
     _comeSoon = comeSoon;
   }catch(e) {
     print("error comeSoon $e");
   }finally{
    _isLoading = false;
    notifyListeners();
   }
  }

}