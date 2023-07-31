// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "already_have_account":
            MessageLookupByLibrary.simpleMessage("Already have an account"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "dont_have_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forget_password":
            MessageLookupByLibrary.simpleMessage("Forget Password?"),
        "hint_email": MessageLookupByLibrary.simpleMessage("enter your email"),
        "hint_password":
            MessageLookupByLibrary.simpleMessage("enter your password"),
        "hint_username":
            MessageLookupByLibrary.simpleMessage("enter your name"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "or": MessageLookupByLibrary.simpleMessage("OR"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "signup": MessageLookupByLibrary.simpleMessage("Signup"),
        "test": MessageLookupByLibrary.simpleMessage("test"),
        "title_login":
            MessageLookupByLibrary.simpleMessage("Login to  your account"),
        "username": MessageLookupByLibrary.simpleMessage("UserName")
      };
}
