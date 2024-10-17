import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List<String> Students = [
  'Esel',
  'Louie',
  'King',
  'Marc',
  'Mariella',
  'Mono',
  'Dan',
  'Joana',
  'Loloy',
  'Jomar',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Students List'),
        ),
        body: const StudentsList(),
      ),
    );

     home: DynamicUI(),
  }

  
}

class StudentsList extends StatelessWidget {
  const StudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Students.length,
      itemBuilder: (context, index) {
        final Students = Students[index];
        return ListTile(
          title: Text(
            Students.toUpperCase(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

class DynamicUI extends StatefulWidget {
  @override
  _DynamicUIState createState() => _DynamicUIState();
}

class _DynamicUIState extends State<DynamicUI> {
  Color _containerColor = Colors.blue;
  double _containerSize = 100.0;

  void _changeProperties() {
    setState(() {
      _containerColor =
          _containerColor == Colors.blue ? Colors.red : Colors.blue;
      _containerSize = _containerSize == 100.0 ? 250.0 : 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic UI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _containerSize,
              height: _containerSize,
              color: _containerColor,
              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeProperties,
              child: Text('Added'),
            ),
          ],
        ),
      ),
    );
  }
}

