import 'package:vista_market/src/common/network/models/search/search_request_body.dart';

class SearchQuires {
  factory SearchQuires() => _instance;
  SearchQuires._();
  static final SearchQuires _instance = SearchQuires._();

  Map<String, dynamic> searchMapQuery({required SearchRequestbody body}) {
    return {
      'query': r'''
        query SearchProudtc($title: String, $priceMin: Int, $priceMax: Int) {
          products(price_min: $priceMin, price_max: $priceMax,title: $title) {
            title
            price
             images
          description
          category{
           id
           name
          }
          }
        }
      ''',
      'variables': {
        'title': body.title,
        'priceMin': body.priceMin,
        'priceMax': body.priceMax,
      },
    };
  }
}
