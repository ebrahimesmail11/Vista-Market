import 'package:vista_market/src/common/network/models/search/search_request_body.dart';

class SearchQuires {
  factory SearchQuires() => _instance;
  SearchQuires._();
  static final SearchQuires _instance = SearchQuires._();

  Map<String, dynamic> searchMapQuery({required SearchRequestbody body}) {
    return {
      'query': '''
        {
          products(price_min: ${body.priceMin}, price_max: ${body.priceMax},title: ${body.title}) {
            title
            price
          }
        }
      ''',
    };
  }
}
