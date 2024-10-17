import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yourName_MidtermExam',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<String> items = [
    "Anime",
    "Charlie Action Figure",
    "David's Graphic Novel",
    "Eva's Art Print",
    "Frank's Collectible Toy",
    "Grace's Manga Volume",
    "Isaac's Video Game",
    "Hannah's Cosplay Costume",
    "Jack's Merchandise Bundle",
  ];

  List<bool> addedItems = List.generate(9, (index) => false);

  void _showDetails(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Details"),
        content: Text("Details for ${items[index]}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  void _addItem(int index) {
    setState(() {
      addedItems[index] = !addedItems[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('yourName_MidtermExam')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            color: addedItems[index] ? Colors.green : Colors.white,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(items[index], style: TextStyle(fontSize: 20)),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => _showDetails(index),
                        child: Text("Details"),
                      ),
                      ElevatedButton(
                        onPressed: () => _addItem(index),
                        child: Text(addedItems[index] ? "Added" : "Add"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
