import 'package:flutter/material.dart';
import 'package:prova_pratica/screens/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:prova_pratica/styles/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HttpLink httpLink =
      HttpLink('https://us-central1-ss-devops.cloudfunctions.net/GraphQL');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Prova Prática',
        theme: Styles.theme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
