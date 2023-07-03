import 'package:flutter/material.dart';
import 'Contact.dart';

void main() {
  runApp(MaterialApp(home: ContactsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            onTap: () => _showContactDetails(contact),
          );
        },
      ),
    );
  }

  List<Contact> contacts = [
    Contact(
        name: 'Fahad Islam',
        email: 'fifahad007@gmail.com',
        phoneNumber: '01799942191'),
    Contact(
        name: 'Toni Kroos',
        email: 'toni@.com',
        phoneNumber: '01881385357'),
    Contact(
        name: 'Luca Modric',
        email: 'luca@.com',
        phoneNumber: '01608247299'),
  ];

  void _showContactDetails(Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Name: ${contact.name}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Email: ${contact.email}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Phone Number: ${contact.phoneNumber}',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        );
      },
    );
  }
}
