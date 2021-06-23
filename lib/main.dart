import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var buttons = [
      const TextButtonWidget(),
      const ElevatedButtonWidget(),
      const OutlinedButtonWidget(),
      const IconButtonWidget(),
      const FloatingActionButtonWidget(),
      const PopupMenuButtonWidget(),
      const DropdownButtonWidget(),
    ];
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text("Buttons")),
          body: GridView.count(
            crossAxisCount: 2,
            children: buttons,
          ),
        ));
  }
}

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({Key? key}) : super(key: key);

  @override
  _TextButtonWidgetState createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_count",
          style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500),
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: _handlePressed,
          child: const Text("更新"),
        ),
      ],
    );
  }
}

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget({Key? key}) : super(key: key);

  @override
  _ElevatedButtonWidgetState createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_count",
          style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500),
        ),
        ElevatedButton(
          onPressed: _handlePressed,
          child: const Text("更新"),
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class OutlinedButtonWidget extends StatefulWidget {
  const OutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  _OutlinedButtonWidgetState createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_count",
          style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500),
        ),
        OutlinedButton(
          onPressed: _handlePressed,
          child: const Text(
            "更新",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({Key? key}) : super(key: key);

  @override
  _IconButtonWidgetState createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_count",
          style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500),
        ),
        IconButton(
          iconSize: 50,
          onPressed: _handlePressed,
          color: Colors.blue,
          icon: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  _FloatingActionButtonWidgetState createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_count",
          style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500),
        ),
        FloatingActionButton.extended(
          onPressed: _handlePressed,
          backgroundColor: Colors.blue,
          label: const Text("更新"),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class PopupMenuButtonWidget extends StatefulWidget {
  const PopupMenuButtonWidget({Key? key}) : super(key: key);

  @override
  _PopupMenuButtonWidgetState createState() => _PopupMenuButtonWidgetState();
}

class _PopupMenuButtonWidgetState extends State<PopupMenuButtonWidget> {
  var _selectedValue = "東京";
  final _usStates = [
    "東京",
    "神奈川",
    "埼玉",
    "千葉",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(_selectedValue,
          style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500)),
      PopupMenuButton(
        onSelected: (String x) {
          setState(() {
            _selectedValue = x;
          });
        },
        itemBuilder: (BuildContext context) {
          return _usStates.map((String x) {
            return PopupMenuItem(
              child: Text(x),
              value: x,
            );
          }).toList();
        },
      )
    ]);
  }
}

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.blue, fontSize: 20),
        underline: Container(
          height: 2,
          color: Colors.blueAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
