import 'package:mobx/mobx.dart';
import 'package:pop_up/Helpers/AppNavigations/NavigationMixin.dart';
part 'HomeScreenModel.g.dart';

// Create a class with a name HomeScreenModel and assign the class _HomeScreenModelBase with _$HomeScreenModel,NavigationMixin 
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel,NavigationMixin;

// Declare the _HomeScreenModelBase as abstract class with a mixin Store.
abstract class _HomeScreenModelBase with Store{

// Declare a list with a name collectionOfNames of type String and make it as observable.
@observable
List<String>collectionOfNames=[];

/* Create a void method with a name setNames with a named parameter with the name Names of type list and make it as action for the observable */
@action
void setNames({required List<String> Names})
{
  // Make the list named collectionOfNames as empty.
  collectionOfNames=[];

  // Assign the parameter Names to the collectionOfNames.
  collectionOfNames=Names;
}

}