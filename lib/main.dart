import 'package:flutter/material.dart';
import 'package:flutter_book/appointments/appointments_widget.dart';
import 'package:flutter_book/contacts/contacts_widget.dart';
import 'package:flutter_book/notes/notes_widget.dart';
import 'package:flutter_book/tasks/tasks_widget.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const FlutterBook());
  // var docsDir = await getApplicationDocumentsDirectory();
}

class FlutterBook extends StatelessWidget {
  const FlutterBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("FlutterBook"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.date_range), text: "Appointments"),
                Tab(icon: Icon(Icons.contacts), text: "Contacts"),
                Tab(icon: Icon(Icons.note), text: "Notes"),
                Tab(icon: Icon(Icons.assignment_turned_in), text: "Tasks",)
              ],
            ),
          ),
          body: const TabBarView(children: [
            AppointmentsWidget(), ContactsWidget(), NotesWidget(), TasksWidget()
          ]), // Appointments, Contacts, Notes, Tasks
        ),
      ),
    );
  }
}
