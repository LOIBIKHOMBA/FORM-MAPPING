import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Form')),
        ),
        body: const ContactApp(),
      ),
    );
  }
}

class ContactApp extends StatefulWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  State<ContactApp> createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
  List<Map<String, dynamic>> contacts = [];

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (c, i) {
            return ListTile(
              leading: const CircleAvatar(),
              title: Text(contacts[i]['name']),
              subtitle: Text(contacts[i]['number']),
              trailing: const Icon(Icons.add_call),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  title: const Text("Add new name"),
                  content: Container(
                    width: 150,
                    height: 150,
                    child: Column(
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(labelText: 'Customer Name'),
                          controller: myController,
                        ),
                        TextField(
                          decoration:
                              const InputDecoration(labelText: 'phone number'),
                          controller: myController1,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            contacts.add({
                              'name': myController.text,
                              'number': myController1.text
                            });
                          });
                          Navigator.pop(context); // pop menu disappearing
                        },
                        child: const Text("Submit"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
