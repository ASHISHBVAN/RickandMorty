import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/logic/episodelogic.dart';
import 'package:rick_and_morty/view/character.dart';

class EpisodeList extends StatefulWidget {
  @override
  _EpisodeListState createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<Episodes>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'EPISODES',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: FutureBuilder(
                future: _value.info(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                        child: Center(child: CircularProgressIndicator()));

                  return PageView.builder(
                      itemCount: int.parse(snapshot.data.toString()),
                      itemBuilder: (BuildContext context, pindex) {
                        return FutureBuilder(
                            future: _value.result(pindex + 1),
                            builder: (context, AsyncSnapshot<List?> snap) {
                              if (!snap.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return ListView.builder(
                                    itemCount: snap.data!.length,
                                    itemBuilder: (BuildContext context, int n) {
                                      return Material(
                                          child: ListTile(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Character(snap
                                                                    .data![n][
                                                                'characters'])));
                                              },
                                              leading: Text(
                                                '${snap.data![n]['id']}',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              trailing: Text(
                                                '${snap.data![n]['episode']}',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15),
                                              ),
                                              title: Text(
                                                  "${snap.data![n]['name']}")));
                                    });
                              }
                            });
                      });
                })));
  }
}
