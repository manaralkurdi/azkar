import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MorningSound extends StatefulWidget {
  @override
  _MorningSoundState createState() => _MorningSoundState();
}

class _MorningSoundState extends State<MorningSound> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Color(0xFF9FAEC7),
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFE9FD),
        iconTheme: IconThemeData(
          color: Color(0xFF9FAEC7),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFDFE9FD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(
            //   image: ExactAssetImage('assets/images/download.jpg'),
            // ),
            Container(
              height: _size.height * 0.2,
              width: _size.width,
              decoration: BoxDecoration(
                color: Color(0xFFDEE7F6),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 8,
                      spreadRadius: 1),
                ],
              ),
              child: Container(
                width: _size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueGrey[500],
                      ),
                    ),
                    slider(),
                    Text(
                      "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueGrey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: _size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _myButton(
                  () {
                    seekToSec(position.inSeconds - 10);
                  },
                  _size.width * 0.24,
                  _size.height * 0.11,
                  Icons.skip_previous,
                ),
                _myButton(
                  () {
                    if (!playing) {
                      //now let's play the song
                      cache.play("elwrd.mp3");
                      setState(() {
                        playBtn = Icons.pause;
                        playing = true;
                      });
                    } else {
                      _player.pause();
                      setState(() {
                        playBtn = Icons.play_arrow;
                        playing = false;
                      });
                    }
                  },
                  _size.width * 0.3,
                  _size.height * 0.14,
                  playBtn,
                ),
                _myButton(
                  () {
                    seekToSec(position.inSeconds + 10);
                  },
                  _size.width * 0.24,
                  _size.height * 0.11,
                  Icons.skip_next,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _myButton(Function onTap, double width, double height, IconData icon) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xFFDEE7F6),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 8,
              spreadRadius: 1),
        ],
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 60,
          color: Color(0xFF9FAEC7),
        ),
      ),
    );
  }
}
