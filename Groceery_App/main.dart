import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
  class _HomeScreenState extends State<HomeScreen>{
  List<String> groceries = ['Apples', 'Oranges', 'Banana'];
  List<double> prices = [1.03, 2.07, 1.37];
  final textController = TextEditingController();
  int? groceryIndex;
  IconData buttonIcon =Icons.add;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Expanded(child: TextField(controller: textController,),),
          ElevatedButton(
            child: Icon(buttonIcon),
            onPressed: () { setState(()
            {if(groceryIndex!=null)
            {groceries[groceryIndex!]=textController.text;
            groceryIndex=null;
            buttonIcon=Icons.add;}
            else{
              groceries.add(textController.text);
              textController.clear();
            }});
              },
          )
        ],
      )),
      body: ListView.builder(
          itemCount: groceries.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                title: Text(groceries[index]),
                trailing: Text('\$${prices[index]}'),
                 onTap: (){setState(() {
                   groceryIndex=index;
                   textController.text = groceries[index];
                   buttonIcon=Icons.save;
                 });},
                  onLongPress: (){setState(() {
                    groceries.removeAt(index);
                  });},

            ));
          }),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
