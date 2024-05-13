import 'package:flutter/material.dart';
import 'create_reminder_page.dart';
import 'reminder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Reminder> reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Carminder'),
      body: reminders.isEmpty
          ? const Center(child: Text('No reminders yet'))
          : ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              reminders[index].serviceType,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Model: ${reminders[index].vehicleModel}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Year: ${reminders[index].vehicleYear}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Date & Time: ${reminders[index].formattedDateTime}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Handle reminder tap
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  reminders.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateReminderPage(
                        onReminderAdded: (reminder) {
                          setState(() {
                            reminders.add(reminder);
                          });
                        },
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }
}
