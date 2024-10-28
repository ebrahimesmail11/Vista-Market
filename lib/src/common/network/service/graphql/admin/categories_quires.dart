import 'package:vista_market/src/common/network/models/create_category/create_category_request.dart';
import 'package:vista_market/src/common/network/models/update_category/update_category_request_body.dart';

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

  Map<String, dynamic> createAddCategory({
    required CreateCategoryRequest body,
  }) {
    return {
      'query': r'''
          mutation AddCategory($name:String!,$image:String!){
           addCategory(
              data: { name: $name, image: $image }
            ) {
              id
              name
              image
            }
          }
          ''',
      'variables': {
        'name': body.name,
        'image': body.image,
      },
    };
  }

  Map<String, dynamic> deleteCategoryMapQuery({required String categoryId}) {
    return {
      'query': r'''
          mutation deleteCategory($categoryId: ID!) {
            deleteCategory(id: $categoryId) 
          }
          ''',
      'variables': {'categoryId': categoryId},
    };
  }

  Map<String, dynamic> updateCategoryMapQuery(
      {required UpdateCategoryRequestBody body,}) {
    return {
      'query': r'''
          mutation updateCategory($id: ID!,$name: String!, $image: String!) {
            updateCategory(id: $id, changes: { name: $name, image: $image }) {
              id
              name
              image
            }
          }
          ''',
      'variables': {'id': body.id, 'name': body.name, 'image': body.image},
    };
  }
}
