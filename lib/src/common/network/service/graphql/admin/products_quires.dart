class ProductsQuires {
  factory ProductsQuires() {
    return _instance;
  }
  ProductsQuires._();
  static final ProductsQuires _instance = ProductsQuires._();
  Map<String, dynamic> getAllProductsMapQuery() {
    return {
      'query': '''
        {
          products{
            title
            description
            price
            category{
              name
            }
          }
        }
      ''',
    };
  }
}