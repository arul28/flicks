// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> newUsernameAvailable(String newUsername) async {
  final client = Supabase.instance.client;

  final response = await client
      .from('users')
      .select('user_name')
      .eq('user_name', newUsername)
      .execute();

  // If there is no user with the same name, the response data will be empty
  // otherwise return false indicating username is already taken
  if (response.data.isEmpty) {
    return true;
  } else {
    return false;
  }
}
