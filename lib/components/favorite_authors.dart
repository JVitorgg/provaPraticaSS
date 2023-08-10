import 'package:flutter/material.dart';
import '../styles/styles.dart';

class FavoriteAuthors extends StatefulWidget {
  final List favoriteAuthors;

  const FavoriteAuthors(this.favoriteAuthors, {super.key});

  @override
  State<FavoriteAuthors> createState() => _FavoriteAuthorsState();
}

class _FavoriteAuthorsState extends State<FavoriteAuthors> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.favoriteAuthors.length,
        itemBuilder: (context, index) {
          final author = widget.favoriteAuthors[index];
          final name = author["name"] as String?;
          final booksCount = author["booksCount"] as int?;
          final picture = author["picture"] as String?;

          return Padding(
            padding: EdgeInsets.fromLTRB(screenWidth * 0.04,
                screenHeight * 0.00, screenWidth * 0.04, screenHeight * 0.00),
            child: Container(
              width: screenWidth * 0.73,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.125,
                      child: Image.network(
                        picture ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? '',
                          maxLines: 1,
                          style: Styles.bold,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${booksCount.toString()} ${booksCount == 1 ? 'livro' : 'livros'}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ],
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
