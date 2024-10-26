class CategoriesQuires {
  factory CategoriesQuires() {
    return _instance;
  }
  CategoriesQuires._();

  static final CategoriesQuires _instance = CategoriesQuires._();

  Map<String, dynamic> getAllCategories() {
    return {
      'query': '''
           {
            categories{
              id
              name
              image
            }
          }
          ''',
    };
  }
}
