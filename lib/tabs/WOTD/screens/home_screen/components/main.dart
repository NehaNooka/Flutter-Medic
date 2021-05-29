import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:wallpaper/tabs/WOTD/key.dart';
import 'package:wallpaper/tabs/WOTD/models/word.dart';
import 'dart:convert';


var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String today = formatter.format(now);

final String url = 'https://api.wordnik.com/v4/words.json/wordOfTheDay?date=' +
    today +
    '&api_key=' +
    apiKey;

Future<Word> fetchWord() async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Word.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load word.');
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Future<Word> futureWord;
  @override
  void initState() {
    super.initState();
    futureWord = fetchWord();
  }
  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.speak(text);
  }
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder<Word>(
                future: futureWord,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${snapshot.data.word[0].toUpperCase()}${snapshot.data.word.substring(1)}',
                              style: GoogleFonts.aldrich(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Colors.deepPurple,
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  color: Colors.deepPurple,
                                ),
                                onPressed: () => speak('${snapshot.data.word[0].toUpperCase()}${snapshot.data.word.substring(1)}')),
                          ],
                        ),
                        Text(
                          snapshot.data.definitions[0].partOfSpeech,
                          style: GoogleFonts.aldrich(
                            fontSize: 18,
                            color: Colors.black45,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          snapshot.data.definitions[0].text,
                          style: GoogleFonts.aldrich(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Could not fetch word of the day :(');
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
