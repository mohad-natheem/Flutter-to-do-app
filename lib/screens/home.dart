import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../widgets/todo_item.dart';


import '../constants/colors.dart';

class Home extends StatefulWidget {
  Home({Key? key}) :super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList(); 
    List<ToDo> _foundToDo = []; 
  final todoController = TextEditingController();


  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: tdBGColor,

      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 40,
                          bottom: 20,
                        ),
                        child: Text('All ToDos',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      ),
                      for(ToDo todoo in _foundToDo.reversed )
                        ToDoItem(todo:todoo,
                        onToDoChange: _handleToDoChange,
                        deleteToDo: _DeleteToDoItem,
                        ),
                      
                    ],
                  ),
                )
                
              ],
            ),
          ),
          Align(
            alignment:Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                margin: EdgeInsets.only(
                  bottom:20,
                  left: 20,
                  right: 20 
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow:const[BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    )],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new to do note',
                      border: InputBorder.none,
                    ),
                  ),

              )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,right: 20),
                child: ElevatedButton(
                  child: Text('+',style: TextStyle(fontSize: 40,),),
                  onPressed:() {
                    _addToDo(todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10
                  ),

                  ),
                  ),
              
            ],
            ),
          )
        ],
      ),

      );
  }



  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor:tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/profile.png'),
          ),
          ),

        
      ]),
    );
  }
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });

  }
  void _DeleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  void _addToDo(String todo){
    setState(() {
      todosList.add(ToDo(
        id:DateTime.now().millisecondsSinceEpoch.toString() ,
         todoText: todo
         ));
    });
    todoController.clear();
  }
 void _runFilter(String enteredText) {
  List<ToDo> result =[];
  if(enteredText.isEmpty){
    result=todosList;
  }else{
    result = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredText.toLowerCase())).toList();
  }
  setState(() {
    _foundToDo= result;
  });
  
}

Widget searchBox(){
  return Container(
              
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: tdBlack,
                    size: 20,
                  ),
                  prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: tdgrey),
                ),
              ),
            );
}

}