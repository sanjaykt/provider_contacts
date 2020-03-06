
import 'package:flutter/cupertino.dart';

import 'contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _allContacts = [];

  List<Contact> get allContact => _allContacts;

  addContact(Contact contact) {
    _allContacts.add(contact);
    notifyListeners();
  }

  deleteContact(int id) {
    for (var contact in _allContacts) {
      if (contact.id == id) {
        _allContacts.removeAt(id);
      }
    }
    notifyListeners();
  }

  updateContact(Contact contact) {
    for (var c in _allContacts) {
      if (c.id == contact.id) {
        c.lastName = contact.lastName;
        c.firstName = contact.firstName;
      }
    }
    notifyListeners();
  }
}
