class DashboardQuries {
  factory DashboardQuries() {
    return _instance;
  }
  DashboardQuries._();
  static final DashboardQuries _instance = DashboardQuries._();
  Map<String, dynamic> numberOfProductsMapQuery() {
    return {
      'query': '''
             {
              products{
              
                title
              }
            }
            ''',
    };
  }

  Map<String, dynamic> numberOfCategoriesMapQuery() {
    return {
      'query': '''
             {
              categories{
              
                name
              }
            }
            ''',
    };
  }

  Map<String, dynamic> numberOfUsersMapQuery() {
    return {
      'query': '''
             {
              users{
              
                name
              }
            }
            ''',
    };
  }
}
