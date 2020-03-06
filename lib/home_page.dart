import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contacts/all_contacts.dart';
import 'package:provider_contacts/contact_model.dart';
import 'package:provider_contacts/contact_provider.dart';

class MyHomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ContactProvider _contactProvider = Provider.of<ContactProvider>(context);
    List<Contact> _allContact = _contactProvider.allContact;
    Contact _newContact = new Contact();
    TextEditingController _firstNameCtrl = new TextEditingController();
    TextEditingController _lastNameCtrl = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Contacts'),
            InkWell(
              child: Text('All Contacts'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AllContacts()));
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _firstNameCtrl,
                  decoration: InputDecoration(labelText: 'First Name'),
                  onSaved: (String value) {
                    _newContact.firstName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Error';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _lastNameCtrl,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  onSaved: (String value) {
                    _newContact.lastName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Error';
                    } else {
                      return null;
                    }
                  },
                ),
                RaisedButton(
                  child: Text('Add'),
                  color: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _contactProvider.addContact(_newContact);
                      _firstNameCtrl.text = '';
                      _lastNameCtrl.text = '';
                    }
                  },
                ),
                _allContact.length > 0 ? Text(_allContact.last.lastName) : Container()
//                Container(
//                  child: ListView.builder(
//                    itemCount: _allContact.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      return ListTile(
//                        title: Text(_allContact[index].firstName + ' ' + _allContact[index].lastName),
//                        leading: Icon(Icons.contacts),
//                      );
//                    },
//                  ),
//                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
