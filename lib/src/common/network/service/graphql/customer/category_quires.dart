class CategoryQuires {
  factory CategoryQuires() {
    return _instance;
  }
  CategoryQuires._();
  static final CategoryQuires _instance = CategoryQuires._();
  Map<String, dynamic> getAllCategories({required int categoryId}) {
    return {
      'query': '''
       {
       products(categoryId: $categoryId,) {
          id
          title
          price
          images
          description
          category {
            id
            name
          }
        }
       }
       ''',
    };
  }
}
