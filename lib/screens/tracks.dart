import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:music_player/screens/music_player.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Tracks extends StatefulWidget {
  const Tracks({Key? key}) : super(key: key);

  @override
  State<Tracks> createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songs = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getTracks();
  }

  void getTracks() async {
    songs = await audioQuery.getSongs();
    setState(() {
      songs = songs;
    });
  }

  void changeTrack(bool isNext) {
    if (isNext) {
      if (currentIndex != songs.length - 1) {
        currentIndex++;
      }
    } else {
      if (currentIndex != 0) {
        currentIndex--;
      }
    }
    var key;
    key.currentState.setSong(songs[currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Listen Now",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search song',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text("johndoe@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 75,
              ),
            ),
            ListTile(
              leading: Icon(Icons.audiotrack_outlined),
              title: Text('Listen Now'),
            ),
            ListTile(
              leading: Icon(Icons.star_border_purple500),
              title: Text('Top charts'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('New releases'),
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Music library'),
            ),
            Divider(
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 10,
            ),
            ListTile(
              title: Text('Settings'),
            ),
            ListTile(
              title: Text('Help & Feedback'),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: songs.length,
        itemBuilder: (context, index) => ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
            title: Text(songs[index].title),
            subtitle: Text(songs[index].artist),
            onTap: () {
              currentIndex = index;
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MusicPlayer(
                        changeTrack: changeTrack,
                        songInfo: songs[currentIndex],
                        // key: key,
                      )));
            }),
      ),
    );
  }
}
