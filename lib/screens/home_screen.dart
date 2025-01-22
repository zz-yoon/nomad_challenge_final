import 'package:flutter/material.dart';
import 'package:nomad_challenge_final/network/models/movie_detail_model.dart';
import 'package:nomad_challenge_final/providers/movie_provier.dart';
import 'package:nomad_challenge_final/screens/movie_detail_screen.dart';
import 'package:nomad_challenge_final/widgets/section_title.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieProvider = Provider.of<MovieProvider>(context, listen: false);
      movieProvider.fetchPopularMovies();
      movieProvider.fetchNowPlay();
      movieProvider.fetchComeSoon();
    });
  }


  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Popular Movies
                const SectionTitle(title: 'Popular Movies'),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieProvider.popularMovies.length,
                    itemBuilder: (context, index) {
                      final movie =
                      movieProvider.popularMovies[index];
                      return GestureDetector(
                        onTap : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:(context) => MovieDetailScreen(
                                movie: MovieDetail.fromJson(movie),
                            ),
                            ),
                          );
                        },
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 8.0,
                                left: index == 0 ? 8.0 : 4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500/${movie['poster_path']}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ) ,
                            ),
                          ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30,),
                // now in cinemas
                const SectionTitle(title: 'Now in Cinemas'),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 250.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount : movieProvider.nowPlay.length,
                    itemBuilder: (context,index) {
                      final movie = movieProvider.nowPlay[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder:
                            (context) => MovieDetailScreen(
                              movie: MovieDetail.fromJson(movie),
                          ),
                          ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  width: 150.0,
                                  height:150.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                      child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${movie['poster_path'] ?? ''}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              SizedBox(
                                width:150.0,
                                child: Text(
                                  movie['title'],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                        )
                      );
                    },

                  )
                ),
                // Coming soon
                const SectionTitle(title: 'Coming soon'),
                const SizedBox(height: 16.0),
                SizedBox(
                    height: 350.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount : movieProvider.comeSoon.length,
                      itemBuilder: (context,index) {
                        final movie = movieProvider.comeSoon[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context, MaterialPageRoute(builder:
                                  (context) => MovieDetailScreen(
                                    movie: MovieDetail.fromJson(movie),
                              ),
                              ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${movie['poster_path']}",
                                      width: 150.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  SizedBox(
                                    width:150.0,
                                    child: Text(
                                      movie['title'],
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            )
                        );
                      },

                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
