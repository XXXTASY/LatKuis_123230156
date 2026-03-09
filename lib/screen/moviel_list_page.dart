// import 'package:flutter/material.dart';

// class MovieListPage extends StatelessWidget {
//   const MovieListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     /*
//       implementasikan widget untuk menampilkan list movie yang sudah diambil dari dummy data
//         - gunakan ListView.builder untuk menampilkan list movie
//         - setiap item movie ditampilkan menggunakan Card widget yang berisi judul movie dan poster movie
//         - ketika item movie ditekan, navigasikan ke halaman MovieDetailPage dengan membawa data movie yang dipilih
        
    
//      */
//     return const Placeholder();
//   }
// }


import 'package:flutter/material.dart';
import '../models/movie_model.dart'; 
import 'movie_detail_page.dart';
import 'login_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Film'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final MovieModel movie = movieList[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.network(
                      movie.imgUrl,
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                          const SizedBox(width: 100, height: 150, child: Icon(Icons.broken_image)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text('Tahun: ${movie.year}'),
                          Text('Genre: ${movie.genre}'),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orange, size: 18),
                              const SizedBox(width: 4),
                              Text(movie.rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}