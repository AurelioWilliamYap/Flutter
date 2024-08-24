import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShoppingList(),
    );
  }
}

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final List<String> _shoppingItems = [];
  final TextEditingController _textController = TextEditingController();

  void _addItem(String item) {
    if (item.isNotEmpty) {
      setState(() {
        _shoppingItems.add(item);
      });
      _textController.clear();
    }
  }

  void _removeItem(int index) {
    setState(() {
      _shoppingItems.removeAt(index);
    });
  }

  Widget _buildItem(String itemText, int index) {
    return ListTile(
      title: Text(itemText),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => _removeItem(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter an item',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addItem(_textController.text),
                ),
              ),
              onSubmitted: _addItem,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _shoppingItems.length,
              itemBuilder: (context, index) {
                return _buildItem(_shoppingItems[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
