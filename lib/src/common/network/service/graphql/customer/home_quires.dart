class HomeQuires {
  factory HomeQuires() => _instance;

  HomeQuires._();
  static final HomeQuires _instance = HomeQuires._();

  Map<String, dynamic> getBanners() {
    return {
      'query': '''
         {
          products{
            images
            title
          }
        }
        ''',
    };
  }
}
