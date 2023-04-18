import 'package:flutter/material.dart';
import 'dart:async';
import 'todo.dart';
import 'todoitem.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = ToDo.todoList();
  List<ToDo> _foundtodo = [];
  final _todocontroller = TextEditingController();

  @override
  void initState() {
    _foundtodo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 226, 245),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchbox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All To Do's",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todoo in todoslist.reversed)
                        todoitem(
                          todo1: todoo,
                          ontodochanged: _handleToDoChange,
                          ondeleteitem: _deletetodoitem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) => _runfilter(value),
                      controller: _todocontroller,
                      decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    onPressed: () {
                      _addtodoitem(_todocontroller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 96, 94, 239),
                      minimumSize: Size(50, 50),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isdone = !(todo.isdone!);
    });
  }

  void _deletetodoitem(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void _addtodoitem(String todo) {
    setState(() {
      todoslist.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todotext: todo,
      ));
    });
    _todocontroller.clear();
  }

  void _runfilter(String entered) {
    List<ToDo> results = [];
    if (entered.isEmpty) {
      results = todoslist;
    } else {
      results = todoslist
          .where((item) =>
              item.todotext!.toLowerCase().contains(entered.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundtodo = results;
    });
  }

  Widget searchbox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 157, 201, 242),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(
              Icons.search,
              size: 30,
              color: Color.fromARGB(255, 9, 0, 0),
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 30,
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 6, 0, 0),
            )),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 19, 161, 209),
      elevation: 10,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu,
          size: 25,
        ),
        Text(
          "Write Your To Do's ..",
          style: TextStyle(
            color: Color.fromARGB(255, 245, 249, 249),
          ),
        ),
      ]),
    );
  }
}
