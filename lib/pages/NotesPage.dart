import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';



class MyJournalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF081827),
      ),
      debugShowCheckedModeBanner: false,
      home: JournalScreen(),
    );
  }
}

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  TextEditingController _textController = TextEditingController();
  List<Entry> entries = [];
  String? _selectedImage;
  String? _selectedSticker;

  void _addEntry() {
    if (_textController.text.isNotEmpty ||
        _selectedImage != null ||
        _selectedSticker != null) {
      setState(() {
        entries.add(Entry(
          text: _textController.text,
          imagePath: _selectedImage,
          dateTime: DateTime.now(),
        ));
        _textController.clear();
        _selectedImage = null;
        _selectedSticker = null;
      });
    }
  }

  void _deleteEntry(int index) {
    setState(() {
      entries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Notes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.save),
                      onPressed: _addEntry,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(Icons.image),
                      onPressed: () async {
                        final image = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        setState(() {
                          _selectedImage = image?.path;
                        });
                      },
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Implement delete
                        if (entries.isNotEmpty) {
                          _deleteEntry(entries.length - 1);
                        }
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _textController,
                  style: TextStyle(color: Colors.white),
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Write your entry...',
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  _textController.text,
                  style: TextStyle(
                    color:
                        entries.isNotEmpty ? Color(0xFFF4BE0A) : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return EntryCard(
                  entry: entries[index],
                  onDelete: () => _deleteEntry(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Entry {
  final String text;
  final String? imagePath;
  final DateTime dateTime;

  Entry({
    required this.text,
    required this.imagePath,
    required this.dateTime,
  });
}

class EntryCard extends StatelessWidget {
  final Entry entry;
  final VoidCallback onDelete;

  EntryCard({required this.entry, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF4BE0A),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.text,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 4.0),
            Text(
              '${DateFormat.yMMMMd().add_jm().format(entry.dateTime)}',
              style: TextStyle(color: Colors.black54, fontSize: 12.0),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
          color: Colors.black,
        ),
      ),
    );
  }
}
