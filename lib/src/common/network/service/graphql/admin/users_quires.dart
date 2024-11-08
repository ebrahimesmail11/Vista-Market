class UsersQuires {
  factory UsersQuires() {
    return _instance;
  }
  UsersQuires._();
  static final UsersQuires _instance = UsersQuires._();
  Map<String, dynamic> getAllUsersMapQuery() {
    return {
      'query': '''
      {
        users{
          id
          name
          email
        }
      }
    ''',
    };
  }

  Map<String, dynamic> deleteUserMapQuery({required String userId}) {
    return {
      'query': r'''
      mutation DeleteUser($userId: ID!) {
        deleteUser(id: $userId) 
      }
    ''',
      'variables': {'userId': userId},
    };
  }
}
