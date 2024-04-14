import 'package:flutter/material.dart';

import '../models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;

  const EditScreen({super.key,this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {

    if(widget.note!=null)
    {
    _titleController = TextEditingController(text: widget.note!.title);
    _contentController = TextEditingController(text: widget.note!.content);
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.grey.shade900,
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: Column(children: [       
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                }, 
                padding: EdgeInsets.all(0),
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)
                    ),
                  child: const Icon(
                    Icons.arrow_back_ios_new, 
                    color: Colors.white,
                    ),
                  ))
              ],
            ),
            Expanded(child: ListView(
              children: [
                TextField(
                  controller: _titleController,
                  style:const TextStyle(color: Colors.grey,fontSize: 30) ,
                  decoration:const  InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 30),
                  ) ,
                ),
                  TextField(
                    controller: _contentController,
                    style: const TextStyle(color: Colors.grey,fontSize: 18) ,
                    maxLines: null,
                    decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type something here',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                  ) ,
                )
              ],
            )) 
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context,[
              _titleController.text, _contentController.text
            ]
          );
        },
        elevation: 8,
        backgroundColor: Colors.grey.shade800,
        child: Icon(Icons.save),
        ),
    );
  }
}