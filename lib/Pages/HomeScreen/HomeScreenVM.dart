import 'HomeScreenModel.dart';
import 'package:pop_up/Helpers/AppNavigations/NavigationMixin.dart';

// Create a class with a name HomeScreenVM which inherits the class HomeScreenModel
class HomeScreenVM extends HomeScreenModel{

/* Create a method with a name onUserClick with a named parameter of name userName of type String and as required */
  void onUserClick({required String userName})
  {
    
    //check whether the userName not equal to empty.
    if(userName!=""){

      // Add the userName to the list named collectionOfNames
      collectionOfNames.add(userName);

      // Call the method named setNames and pass the collectionOfNames as parameter.
      setNames(Names:collectionOfNames);

    }
  }

/* Create a method with a name as navigateToPreviousScreen of return type void.*/
void navigateToPreviousScreen()
{
  // Add the NavigatorPop() to the navigationStream.
  navigationStream.add(NavigatorPop());
}


}