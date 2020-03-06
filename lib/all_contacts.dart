import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contacts/contact_model.dart';
import 'package:provider_contacts/contact_provider.dart';

class AllContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Contact> _allContact = Provider.of<ContactProvider>(context).allContact;

    return Scaffold(
      appBar: AppBar(title: Text('All Contacts'),),
      body: Container(
        child: ListView.builder(
          itemCount: _allContact.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_allContact[index].firstName + ' ' + _allContact[index].lastName),
              leading: Icon(Icons.contacts),
            );
          },
        ),
      ),
    );
  }
}
