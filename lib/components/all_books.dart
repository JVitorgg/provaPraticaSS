import 'package:flutter/material.dart';
import 'package:prova_pratica/screens/book_page.dart';
import '../styles/styles.dart';

class AllBooks extends StatelessWidget {
  final List allBooks;

  const AllBooks(this.allBooks, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allBooks.length,
      itemBuilder: (context, index) {
        final book = allBooks[index];
        final String name = book["name"] ?? '';
        final String cover = book["cover"] ?? '';
        final String author = book["author"]["name"] ?? '';
        final String id = book['id'] ?? '';

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => LivroDetalhes(id: id)),
              ),
            );
          },
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      cover,
                      width: screenWidth * 0.17,
                      height: screenHeight * 0.11,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: screenWidth * 0.69,
                    height: screenHeight * 0.11,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.bold,
                        ),
                        Text(
                          author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
