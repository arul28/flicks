import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? strToImgPath(String? str) {
  // null safety
  str ??= ' ';

  return str; //
}

int addOne(int index) {
  return index + 1;
}

String? phonNumValidate(String? num) {
// Return null if the input is null
  if (num == null) {
    return null;
  }

  // Remove all non-digit characters and whitespace
  String cleanedNumber = num.replaceAll(RegExp(r'[^0-9]'), '');

  // Check if the cleaned number has a valid length of 10
  if (cleanedNumber.length == 10) {
    return cleanedNumber;
  }

  // Return null if the number is not valid
  return null;
}
