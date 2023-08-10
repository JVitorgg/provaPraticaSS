import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:prova_pratica/styles/styles.dart';
import '../utils/querys.dart';

class LivroDetalhes extends StatefulWidget {
  final String id;
  const LivroDetalhes({
    super.key,
    required this.id,
  });

  @override
  State<LivroDetalhes> createState() => _LivroDetalhesState();
}

class _LivroDetalhesState extends State<LivroDetalhes> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      body: Query(
        options: QueryOptions(document: gql(Querys().bookDetails)),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          List<dynamic> allBooks = result.data?["allBooks"] as List<dynamic>;

          final book = allBooks[int.parse(widget.id) - 1];
          final String name = book["name"] ?? '';
          final String author = book["author"]["name"] ?? '';
          final String cover = book["cover"] ?? '';
          final String description = book["description"] ?? '';
          final bool isFavorite = book["isFavorite"] ?? '';

          return Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 1.0,
                child: Image.network(
                  cover,
                  fit: BoxFit.fill,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.only(
                  top: screenSize.height * 0.4,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(name, style: Styles.bold),
                      subtitle: Text(author),
                      trailing: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? const Color(0xFFA076F2) : null),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              screenWidth * 0.02,
                              screenHeight * 0.02,
                              screenWidth * 0.02,
                              screenHeight * 0.02),
                          child: Text(
                            description,
                            style: Styles.default16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.18,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.01),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      color: Colors.white,
                      onPressed: () {},
                    ),
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
            icon: Icon(
              Icons.house,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
            ),
            label: 'Adicionar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
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
