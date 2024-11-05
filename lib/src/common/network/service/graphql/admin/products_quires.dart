import 'package:vista_market/src/common/network/models/create_product/create_product_request_body.dart';
import 'package:vista_market/src/common/network/models/update_product/update_product_request_body.dart';

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
            id
            title
            description
            price
            images
            category{
              id
              name
            }
          }
        }
      ''',
    };
  }

  Map<String, dynamic> creatProductsMapQuery({
    required CreateProductRequestBody body,
  }) {
    return {
      'query': r'''
        mutation AddProduct($title:String!,$description:String!,$price:Float!,$images:[String!]!,$categoryId:Float!){
          addProduct(
          data: {
            title: $title, 
            description: $description,
            price: $price,
            images: $images, 
            categoryId: $categoryId
          }) {
            title
          }
        }
      ''',
      'variables': {
        'title': body.title,
        'description': body.description,
        'price': body.price,
        'images': body.images,
        'categoryId': body.categoryId,
      },
    };
  }

  Map<String, dynamic> deleteProductMapQuery({required String productId}) {
    return {
      'query': r'''
        mutation DeleteProduct($productId: ID!) {
          deleteProduct(id: $productId) 
        }
      ''',
      'variables': {'productId': productId},
    };
  }

  Map<String, dynamic> updateProductMapQuery({
    required UpdateProductRequestBody body,
  }) {
    return {
      'query': r'''
        mutation UpdateProduct($productId: ID!,$title: String!, $description: String!, $price: Float!, $images: [String!]!, $categoryId: Float!) {
          updateProduct(
          id: $productId,
           changes: {
            categoryId: $categoryId,
            title: $title,
            description: $description, 
            price: $price,
            images: $images
           }) {
            
            title
            
          }
        }
        ''',
      'variables': {
        'productId': body.productId,
        'categoryId': body.categoryId,
        'title': body.title,
        'description': body.description,
        'price': body.price,
        'images': body.images,
      },
    };
  }
}
