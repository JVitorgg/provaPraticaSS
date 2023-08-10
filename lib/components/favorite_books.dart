import 'package:flutter/material.dart';
import 'package:prova_pratica/styles/styles.dart';
import '../screens/book_page.dart';

class FavoriteBooks extends StatefulWidget {
  final List favoriteBooks;

  const FavoriteBooks(this.favoriteBooks, {super.key});

  @override
  State<FavoriteBooks> createState() => _FavoriteBooksState();
}

class _FavoriteBooksState extends State<FavoriteBooks> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return SizedBox(
      height: screenHeight * 0.45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.favoriteBooks.length,
        itemBuilder: (context, index) {
          final book = widget.favoriteBooks[index];
          final String name = book["name"] ?? '';
          final String author = book["author"]["name"] ?? '';
          final String cover = book["cover"] ?? '';
          final String id = book["id"] ?? '';

          return SizedBox(
            width: screenWidth * 0.4,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => LivroDetalhes(id: id)),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        cover,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      overflow: TextOverflow.ellipsis,
                      name,
                      maxLines: 2,
                      style: Styles.bold,
                    ),
                    subtitle: Text(
                      overflow: TextOverflow.ellipsis,
                      author,
                      maxLines: 1,
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
