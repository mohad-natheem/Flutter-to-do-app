import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final deleteToDo;
  const ToDoItem({super.key,required this.todo,required this.onToDoChange,required this.deleteToDo});

  @override
  Widget build(BuildContext context) {  
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          onToDoChange(todo);

        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
          ),
        tileColor: Colors.white,
        leading: Icon(
         todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
          color: tdBlue,
          ),
        title: Text(
          todo.todoText!,style: TextStyle(fontSize: 16,color: tdBlack, decoration: todo.isDone? TextDecoration.lineThrough:null),
          ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            icon:Icon(Icons.delete),
            iconSize: 18,
            color: Colors.white,
            onPressed: () {
              deleteToDo(todo.id);
            },),
        )
      ),
    );
  }
}