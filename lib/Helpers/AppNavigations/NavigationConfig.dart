// ignore_for_file: constant_identifier_names, file_names, non_constant_identifier_names

import '../../Pages/HomeScreen/HomeScreen.dart';
import 'NavigationHelpers.dart';

// Declare the Routes HomeScreen as Enum 
enum Routes {
  HomeScreen,
}

// Create class named Pages which holds the pages in the application 
class Pages{ 
   
  // Create a PageConfiguration for the HomeScreen with the route and the build.
  static final PageConfig homeScreenConfig = PageConfig(route: Routes.HomeScreen , build: (_) => HomeScreen());
}