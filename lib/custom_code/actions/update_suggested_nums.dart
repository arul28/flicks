// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Import package
import 'package:contacts_service/contacts_service.dart';

Future updateSuggestedNums() async {
  List<String?> phones = [];

  Iterable<Contact> _contacts =
      await ContactsService.getContacts(withThumbnails: false);

  _contacts.forEach((contact) {
    contact.phones?.toSet().forEach((phone) {
      phones.add(phone?.value);
    });
  });
}
