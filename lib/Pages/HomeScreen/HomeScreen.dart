import 'package:flutter/material.dart';
import 'package:pop_up/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:pop_up/Helpers/AppNavigations/NavigationMixin.dart';
import 'HomeScreenVM.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// Create a statefulWidget with named HomeScreen.
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

// Create a instance named _homeScreenVM for the class HomeScreenVM and make it as final.
final HomeScreenVM _homeScreenVM = HomeScreenVM();

//Create a instance named _textEditingController for the class TextEditingController and make it as final.
final TextEditingController _textEditingController = TextEditingController();

/* Declare the initState method */
@override
void initState()
{
  // Invoke the initstate of parent class.
  super.initState();

  // Using the instance access the navigationStream and access the Stream and listen the event
  _homeScreenVM.navigationStream.stream.listen((event){

    // Check whether the event is NavigatorPush
     if(event is NavigatorPop){
  
        // Pop the context
        context.pop();
      }
  });
 
}

/* Declare dispose method */
@override
void dispose()
{
  // Using the instance _textEditingController,call the method dispose().
  _textEditingController.dispose();

  // Using the instance _homeScreenVM,call the method dispose().
  _homeScreenVM.dispose();

  // Using the super keyword call the dispose method.
  super.dispose();
}

/* Create a method named showUserPopup with a named parameter with the variable named index of type integer */
void showUserPopup({required int index})
{

  // Using showDialog widget create a popup view
  showDialog(
    context: context,
     builder: (context)
     {

      // Return the AlertDialog widget which shows the popup over the existing view.
      return AlertDialog(

        // Create a text widget and Consume the list using the instance _homeScreenVM.
        title: Text(_homeScreenVM.collectionOfNames[index].toString()),
        actions: [
          ElevatedButton(onPressed: (){
             _homeScreenVM.navigateToPreviousScreen();
          }, child: const Text("Go Back"),
          )
        ],
      );
     });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff645CBB),
          title: const Text("POP UP",style: TextStyle(color: Colors.white)),
        ),
        body: SafeArea (
          child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  label: Text("Name"),constraints: const BoxConstraints(maxHeight: 70,maxWidth: 400),hintText: "Enter your name"),
                  controller: _textEditingController,
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){

                  // Using the instance, call the method onUserClick and pass the text from the texxtformfield using the instance _textEditingController
                    _homeScreenVM.onUserClick(userName: _textEditingController.text);
                  }
                , child: Text("Add Name")),
                const SizedBox(height: 10,),
                Observer(
                  builder: (context) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _homeScreenVM.collectionOfNames.length,
                      itemBuilder: (context, index) {
                       return ListTile(
                          title :Text(_homeScreenVM.collectionOfNames[index]),
                          trailing: OutlinedButton(
                            onPressed: (){
                              
                              /* Call the method showUserPopup and the index of the builder to the parameter.*/
                              showUserPopup(index: index);
                            },
                            style:const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color(0xff645CBB)
                            )),
                            child: const Icon(Icons.edit,color: Colors.white,))
                       );
                      },);
                  }
                )
              ],
            ),
          ),
        ) 
        ,)
    );
  }
}