import 'package:flutter/material.dart';
import 'package:hack/brain/sentiApi.dart';

import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
class SentimentPage extends StatefulWidget {
  const SentimentPage({Key? key}) : super(key: key);

  @override
  State<SentimentPage> createState() => _SentimentPageState();
}

class _SentimentPageState extends State<SentimentPage> {
  final TextEditingController textcontroller = TextEditingController();
  var data;
  
  String senti = "Press submit";
  String playlistinfo = "";
  String link = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xFF081827),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "Type out what do you \n    feel about today",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: textcontroller,
                      minLines: 5,
                      maxLines: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 10, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter your feelings here....",
                        hintStyle: TextStyle(color: Colors.white)
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60.0,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFF4BE0A),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextButton(
                          onPressed: () async {
                            data = await SentiApi().getSenti(textcontroller.text);
                            print(data['random_node']['mood']);
                            setState(() {
                              link = "";
                              playlistinfo = "";
                              senti = "You are feeling " + data['random_node']['mood'];
                                Map<String, dynamic> playlists = data['random_node']['playlist'];
                                
                                  playlistinfo += playlists['name']+" by "+playlists['owner'];
                                link += playlists['uri'];

                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Submit',
                                style: TextStyle(color: Colors.black, fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      senti,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    
                    SizedBox(height: 20),
                    // Display playlists here
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              playlistinfo,
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                           QrImageView(
                            data: link,
                            version: QrVersions.auto,
                            size: 100.0,
                            backgroundColor: Colors.white,
                          ),
                          Text(
                              link,
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
