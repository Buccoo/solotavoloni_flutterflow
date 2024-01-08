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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? sumClients(TablesRecord? tableDocument) {
  // a function that receive Table Document and return the sum of Clients and FakeClients
  if (tableDocument == null) return null;
  final clients = tableDocument.clients.length;
  final fakeClients = tableDocument.fakeClients.length;
  return (clients + fakeClients).toString();
}

String? formatPhoneNumber(String phoneNumber) {
  return phoneNumber.replaceAll(" ", "");
}
