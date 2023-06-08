class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', todoText: 'Morning Exercise',isDone: true),
      ToDo(id: '02', todoText: 'Take tablets in morning'),
      ToDo(id: '03', todoText: 'Walking',isDone: true),
      ToDo(id: '04', todoText: 'Hit the gym'),
      ToDo(id: '05', todoText: 'Clean your house',isDone: true),
      ToDo(id: '06', todoText: 'Feed the fishes'),
      ToDo(id: '07', todoText: 'Meeting at 5',isDone: true),
      ToDo(id: '08', todoText: 'Birthday party at 10'),
    ];
  }
}