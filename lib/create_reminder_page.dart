import 'package:flutter/material.dart';
import 'reminder.dart';

class CreateReminderPage extends StatefulWidget {
  final Function(Reminder) onReminderAdded;

  const CreateReminderPage({super.key, required this.onReminderAdded});

  @override
  _CreateReminderPageState createState() => _CreateReminderPageState();
}

class _CreateReminderPageState extends State<CreateReminderPage> {
  late TextEditingController serviceTypeController;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  late String vehicleMake;
  late String vehicleModel;
  late String vehicleYear;

  @override
  void initState() {
    super.initState();
    serviceTypeController = TextEditingController();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    vehicleMake = '';
    vehicleModel = '';
    vehicleYear = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Create Reminder'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: serviceTypeController,
                decoration: const InputDecoration(labelText: 'Service Type'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: const Text('Choose Date'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: const Text('Choose Time'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  vehicleMake = value;
                },
                decoration: const InputDecoration(labelText: 'Vehicle Make'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  vehicleModel = value;
                },
                decoration: const InputDecoration(labelText: 'Vehicle Model'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  vehicleYear = value;
                },
                decoration: const InputDecoration(labelText: 'Vehicle Year'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _addReminder();
                },
                child: const Text('Add Reminder'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              },
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
    await showTimePicker(context: context, initialTime: selectedTime);
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _addReminder() {
    String serviceType = serviceTypeController.text.trim();
    if (serviceType.isNotEmpty &&
        vehicleMake.isNotEmpty &&
        vehicleModel.isNotEmpty &&
        vehicleYear.isNotEmpty) {
      Reminder reminder = Reminder(
        serviceType: serviceType,
        date: selectedDate,
        time: selectedTime,
        vehicleMake: vehicleMake,
        vehicleModel: vehicleModel,
        vehicleYear: vehicleYear,
      );
      widget.onReminderAdded(reminder);
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please complete all fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
