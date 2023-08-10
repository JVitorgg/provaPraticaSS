import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:prova_pratica/components/all_books.dart';
import 'package:prova_pratica/components/genres_tags.dart';
import 'package:prova_pratica/utils/querys.dart';
import 'package:prova_pratica/styles/styles.dart';
import '../components/favorite_authors.dart';
import '../components/initial_card.dart';
import '../components/favorite_books.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      body: Query(
        options: QueryOptions(document: gql(Querys().booksAndAuthors)),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          String? userPicture = result.data?["userPicture"] as String?;
          List<dynamic>? favoriteAuthors =
              result.data?["favoriteAuthors"] as List<dynamic>?;
          List<dynamic>? allBooks = result.data?["allBooks"] as List<dynamic>?;
          List<dynamic>? favoriteBooks =
              allBooks!.where((book) => book["isFavorite"] == true).toList();

          return ListView(
            children: [
              InitialCard(userPicture ?? ''),
              Padding(
                padding: EdgeInsets.fromLTRB(0, screenHeight * 0.04,
                    screenWidth * 0.13, screenHeight * 0.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('Livros favoritos', style: Styles.bold22),
                    Text('ver todos', style: Styles.purpleBold),
                  ],
                ),
              ),
              FavoriteBooks(favoriteBooks),
              Card(
                elevation: 5,
                color: Colors.white,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, screenHeight * 0.04,
                          screenWidth * 0.13, screenHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Autores favoritos', style: Styles.bold22),
                          Text('ver todos', style: Styles.purpleBold),
                        ],
                      ),
                    ),
                    FavoriteAuthors(favoriteAuthors!),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                            screenHeight * 0.03, 0, screenHeight * 0.01),
                        child: const Text('Biblioteca', style: Styles.bold22),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.01),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            GenresTags(
                              label: 'Todos',
                              selected: true,
                            ),
                            GenresTags(
                              label: 'Romance',
                              selected: false,
                            ),
                            GenresTags(
                              label: 'Aventura',
                              selected: false,
                            ),
                            GenresTags(
                              label: 'Comédia',
                              selected: false,
                            ),
                            GenresTags(
                              label: 'Mistério',
                              selected: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AllBooks(allBooks),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Adicionar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFFA076F2),
        selectedLabelStyle: Styles.purple,
        unselectedItemColor: const Color(0xFF9E9E9E),
        showUnselectedLabels: true,
      ),
    );
  }
}
