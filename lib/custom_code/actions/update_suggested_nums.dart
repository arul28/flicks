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
  List<String> phones = [];

  Iterable<Contact> _contacts =
      await ContactsService.getContacts(withThumbnails: false);

  _contacts.forEach((contact) {
    contact.phones?.toSet().forEach((phone) {
      if (phone?.value != null) {
        // Clean up the phone number and remove special characters
        String cleanedNumber = _cleanPhoneNumber(phone!.value!);

        if (cleanedNumber.isNotEmpty) {
          phones.add(cleanedNumber); // Add cleaned number to the list
        }
      }
    });
  });

  print("Length of phones list: ${phones.length}");

  return phones; // Return a List<String>
}

String _cleanPhoneNumber(String phoneNumber) {
  // Remove all non-digit characters and whitespace
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

  // Check if the cleaned number has a valid length
  if (cleanedNumber.length == 10) {
    return cleanedNumber;
  }

  // Return an empty string if the number is not valid
  return '';
}
