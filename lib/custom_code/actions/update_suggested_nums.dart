// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

// Import package
import 'package:contacts_service/contacts_service.dart';

// Future updateSuggestedNums() async {
//   // Iterable<Contact> contacts =
//   //     await ContactsService.getContacts(withThumbnails: false);
//   // List<Contact> contactsList = contacts.toList();

//   // masterList?.clear();

//   // for (int i = 0; i < contactsList.length; i++) {
//   //   masterList?.add(contactsList[i].phones!.first.value.toString());
//   // }

//   List<String?> phones = [];

//   Iterable<Contact> _contacts =
//       await ContactsService.getContacts(withThumbnails: false);

//   _contacts.forEach((contact) {
//     contact.phones?.toSet().forEach((phone) {
//       phones.add(phone?.value);
//     });
//   });

//   // masterList?.clear(); // Clear the masterList if it's not null

// // print("Before function call - masterList length: ${masterList?.length}");

//   // if (phones.isNotEmpty) {
//   //   masterList?.addAll(
//   //       phones.whereType<String>()); // Add non-null phone values to masterList
//   // }
// // print("After function call - masterList length: ${masterList?.length}");
//   // return phones.length
//   //     .toString(); // Return the number of items in phones as a string
// }

Future<List<String>> updateSuggestedNums() async {
  List<String> phones = []; // Changed the type to List<String>

  Iterable<Contact> _contacts =
      await ContactsService.getContacts(withThumbnails: false);

  _contacts.forEach((contact) {
    contact.phones?.toSet().forEach((phone) {
      if (phone?.value != null) {
        // Ensure the phone value is not null
        phones.add(phone!.value!); // Convert to non-nullable String
      }
    });
  });

  print("Length of phones list: ${phones.length}");

  return phones; // Return a List<String>
}
