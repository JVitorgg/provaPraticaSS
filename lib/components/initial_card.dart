import 'package:flutter/material.dart';
import '../styles/styles.dart';

class InitialCard extends StatefulWidget {
  final String fotoPerfil;

  const InitialCard(this.fotoPerfil, {super.key});

  @override
  State<InitialCard> createState() => _InitialCardState();
}

class _InitialCardState extends State<InitialCard> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.07, screenHeight * 0.03, screenWidth * 0.02, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'SS',
                      style: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 33,
                          fontFamily: 'BebasNeue'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'BOOK',
                          style: Styles.purple,
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                      radius: 19.0,
                      backgroundImage: Image.network(widget.fotoPerfil).image),
                ],
              ),
              const Spacer(),
              DefaultTabController(
                length: 2,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: TabBar(
                        indicatorColor: Color(0xFFA076F2),
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text(
                              'Meus livros',
                              style: Styles.bold13,
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Emprestados',
                              style: Styles.bold13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
