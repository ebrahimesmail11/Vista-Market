class ProductsViewAllQuires {
  factory ProductsViewAllQuires() {
    return _instance;
  }
  ProductsViewAllQuires._();
  static final ProductsViewAllQuires _instance = ProductsViewAllQuires._();
  Map<String, dynamic> viewAllProductsQuery({required int offset}) {
    return {
      'query': '''
        products(limit: 6, offset: $offset){
          id
          title
          price
          images
          description
          category{
           id
           name
          }
        }
      ''',
    };
  }
}
