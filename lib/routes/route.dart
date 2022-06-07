import 'package:auto_route/annotations.dart';
import 'package:task/screens/post_request.dart';
import 'package:task/screens/profile.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Login, initial: true),
    AutoRoute(page: Profile,),
    // AutoRoute(page: CovidCountry, initial: true),


  ],
)
class $AppRouter {}