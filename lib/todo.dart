class ToDo {
  String? id;
  String? todotext;
  bool? isdone;

  ToDo({
    this.id,
    this.todotext,
    this.isdone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todotext: 'Morning Excercise', isdone: true),
      ToDo(id: '02', todotext: 'Buy Groceries', isdone: true),
      ToDo(
        id: '03',
        todotext: 'Check Emails',
      ),
      ToDo(
        id: '04',
        todotext: 'Team Meeting',
      ),
      ToDo(
        id: '05',
        todotext: 'Work on mobile apps for 2 hour',
      ),
      ToDo(
        id: '06',
        todotext: 'Dinner with Family',
      ),
    ];
  }
}
