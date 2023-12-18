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

List<Map<String, dynamic>> areas = [
  {
    "areaName": "consolle",
    "displayName": "Consolle",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "franoipasserella",
    "displayName": "Fra Noi Passerella",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "franoi",
    "displayName": "Fra Noi",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "franoiopen",
    "displayName": "Fra Noi Open",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "dongio",
    "displayName": "Dongiò",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "tuobasso",
    "displayName": "Tuo Basso",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "tuoring",
    "displayName": "Tuo Ring",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "tuoopen",
    "displayName": "Tuo Open",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "martinilounge",
    "displayName": "Martini Lounge",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "miobasso",
    "displayName": "Mio Basso",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "mioring",
    "displayName": "Mio Ring",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
  {
    "areaName": "mioopen",
    "displayName": "Mio Open",
    "manPrice": 0,
    "womanPrice": 0,
    "maxPeopleAtTable": 0,
    "minBudgetAtTable": 0,
    "guests": <String>[],
    "tablesList": <DocumentReference>[]
  },
];

Future createAreas(DocumentReference? eventReference) async {
  // action that refecive Event ref argument, and add to his subcollection 3 different Areas document
// Define the list of areas to be added
  Future addAreas() async {
// Ottieni il riferimento alla subcollection
    final areasReference = eventReference!.collection('Areas');

    for (var area in areas) {
      // Aggiungi un documento alla subcollection
      await areasReference.add(area);
    }
  }

  eventReference!.get().then((doc) => {
        if (doc.exists && doc.get("location") == "Cromie")
          {addAreas(), print("Added Cromie Event")}
        else
          {print("Added Clorophilla Event")}
      });
}
