// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<Map<String, dynamic>> cromieAreas = [
  {
    "areaName": "consolle",
    "displayName": "Consolle",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "franoipasserella",
    "displayName": "Fra Noi Passerella",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "franoi",
    "displayName": "Fra Noi",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "franoiopen",
    "displayName": "Fra Noi Open",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "dongio",
    "displayName": "Dongiò",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "tuobasso",
    "displayName": "Tuo Basso",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "tuoring",
    "displayName": "Tuo Ring",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "tuoopen",
    "displayName": "Tuo Open",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "martinilounge",
    "displayName": "Martini Lounge",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "miobasso",
    "displayName": "Mio Basso",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "mioring",
    "displayName": "Mio Ring",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
  {
    "areaName": "mioopen",
    "displayName": "Mio Open",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  },
];

List<Map<String, dynamic>> globalArea = [
  {
    "areaName": "globale",
    "displayName": "Globale",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[],
    "available": true,
  }
];

Future createAreas(DocumentReference? eventReference) async {
  // action that refecive Event ref argument, and add to his subcollection 3 different Areas document
// Define the list of areas to be added
  Future addCromieAreas() async {
// Ottieni il riferimento alla subcollection
    final areasReference = eventReference!.collection('Areas');

    for (var area in cromieAreas) {
      // Aggiungi un documento alla subcollection
      await areasReference.add(area);
    }
  }

  Future addCDMAreas() async {
// Ottieni il riferimento alla subcollection
    final areasReference = eventReference!.collection('Areas');

    for (var area in globalArea) {
      // Aggiungi un documento alla subcollection
      await areasReference.add(area);
    }
  }

  Future addClub73Areas() async {
// Ottieni il riferimento alla subcollection
    final areasReference = eventReference!.collection('Areas');

    for (var area in globalArea) {
      // Aggiungi un documento alla subcollection
      await areasReference.add(area);
    }
  }

  Future addLeucaspideAreas() async {
// Ottieni il riferimento alla subcollection
    final areasReference = eventReference!.collection('Areas');

    for (var area in globalArea) {
      // Aggiungi un documento alla subcollection
      await areasReference.add(area);
    }
  }

  eventReference!.get().then((doc) => {
        if (doc.exists && doc.get("location") == "Cromie")
          {addCromieAreas(), print("Added Cromie Event")}
        else if (doc.exists && doc.get("location") == "CDM")
          {addCDMAreas(), print("Added CDM Event")}
        else if (doc.exists && doc.get("location") == "Club73")
          {addClub73Areas(), print("Added Club73 Event")}
        else if (doc.exists && doc.get("location") == "M. Leucaspide")
          {addClub73Areas(), print("Added Masseria Leucaspide Event")}
        else
          {print("Added Clorophilla Event")}
      });
}
