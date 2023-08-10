class Querys {
  final String booksAndAuthors = """
query{
  allBooks{ id isFavorite name cover author{ name }}
  favoriteAuthors{ name booksCount picture} 
  userPicture
}
""";

  final String bookDetails = """
 query{
  allBooks{ id isFavorite name cover description author{ name }}
}
""";
}
