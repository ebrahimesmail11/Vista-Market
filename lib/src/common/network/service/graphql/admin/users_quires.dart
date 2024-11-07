class UsersQuires {
  factory UsersQuires() {
    return _instance;
  }
  UsersQuires._();
static  final UsersQuires _instance = UsersQuires._();
Map<String , dynamic> getAllUsersMapQuery() {
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
}
