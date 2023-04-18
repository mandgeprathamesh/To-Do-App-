import 'package:flutter/material.dart';

import './todo.dart';

class todoitem extends StatelessWidget {
  final ToDo todo1;
  final ontodochanged;
  final ondeleteitem;

  const todoitem({
    Key? key,
    required this.todo1,
    required this.ondeleteitem,
    required this.ontodochanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        onTap: () {
          ontodochanged(todo1);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo1.isdone! ? Icons.check_box : Icons.check_box_outline_blank,
          color: Color.fromARGB(255, 53, 50, 226),
        ),
        title: Text(
          todo1.todotext!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo1.isdone! ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              ondeleteitem(todo1.id);
            },
            iconSize: 18,
            icon: Icon(Icons.delete),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
