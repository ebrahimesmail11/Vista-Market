class ProudctDetailsQuires {
  factory ProudctDetailsQuires() {
    return _instance;
  }
  ProudctDetailsQuires._();
 static final ProudctDetailsQuires _instance = ProudctDetailsQuires._();
  Map<String, dynamic> getProductDetails({required int id}) {
    return {
      'query': '''
        query {
          product(id: $id) {
            id
            title
            price
            images
            description
            category {
              name
            }
          }
        }
      ''',
    };
  }
}
