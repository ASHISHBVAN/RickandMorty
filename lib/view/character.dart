import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/logic/characterlogic.dart';

class Character extends StatefulWidget {
  final charlist;
  Character(this.charlist);

  @override
  _CharacterState createState() => _CharacterState(this.charlist);
}

class _CharacterState extends State<Character> {
  final charlist;
  String gender = 'Unknown';
  TextEditingController name = TextEditingController();
  _CharacterState(this.charlist);
  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<Characterlogic>(context);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.sort),
                  TextButton(
                    onPressed: () {
                      gender = 'Male';
                      _value.list.clear();
                      _value.info(charlist, 'Male', name.text);
                      setState(() {});
                    },
                    child: Text('Male'),
                  ),
                  TextButton(
                    onPressed: () {
                      gender = 'Female';
                      _value.list.clear();
                      _value.info(charlist, 'Female', name.text);
                      setState(() {});
                    },
                    child: Text('Female'),
                  ),
                  TextButton(
                    onPressed: () {
                      gender = 'Unkonwn';
                      _value.list.clear();
                      _value.info(charlist, 'Unknown', name.text);
                      setState(() {});
                    },
                    child: Text('Re-Set'),
                  )
                ]),
          ),
        ),
        appBar: AppBar(
          title: ListTile(
              leading: (name.text == '')
                  ? Icon(Icons.search)
                  : IconButton(
                      onPressed: () {
                        name.text = '';
                         _value.info(charlist, 'Unknown', name.text);
                        setState(() {});
                      },
                      icon: Icon(Icons.cancel)),
              title: Container(
                  width: 150,
                  child: TextField(
                    controller: name,
                    onSubmitted: (value) {
                      _value.list.clear();
                      _value.info(charlist, gender, name.text);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))),
          centerTitle: false,
        ),
        body: Container(
            color: Colors.white,
            child: FutureBuilder(
                future: _value.info(charlist, gender, name.text),
                builder: (context, AsyncSnapshot<List?> snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                        child: Center(child: CircularProgressIndicator()));

                  return ListView.builder(
                      itemCount:
                          snapshot.data!.length, // (_value.result).length,
                      itemBuilder: (BuildContext context, int n) {
                        // print(charlist[n].toString().split('/').last);
                        return Material(
                            child: ListTile(
                                leading: Text(
                                  '${n + 1}',
                                ),
                                trailing: Text(
                                  '${snapshot.data![n]['gender']}',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15),
                                ),
                                title: Text("${snapshot.data![n]['name']}")));
                      });
                })));
  }
}
