import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "guests" field.
  List<String>? _guests;
  List<String> get guests => _guests ?? const [];
  bool hasGuests() => _guests != null;

  // "bgColor" field.
  Color? _bgColor;
  Color? get bgColor => _bgColor;
  bool hasBgColor() => _bgColor != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "areasRef" field.
  List<DocumentReference>? _areasRef;
  List<DocumentReference> get areasRef => _areasRef ?? const [];
  bool hasAreasRef() => _areasRef != null;

  // "imgUrls" field.
  List<String>? _imgUrls;
  List<String> get imgUrls => _imgUrls ?? const [];
  bool hasImgUrls() => _imgUrls != null;

  // "imgPaths" field.
  List<String>? _imgPaths;
  List<String> get imgPaths => _imgPaths ?? const [];
  bool hasImgPaths() => _imgPaths != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _guests = getDataList(snapshotData['guests']);
    _bgColor = getSchemaColor(snapshotData['bgColor']);
    _location = snapshotData['location'] as String?;
    _areasRef = getDataList(snapshotData['areasRef']);
    _imgUrls = getDataList(snapshotData['imgUrls']);
    _imgPaths = getDataList(snapshotData['imgPaths']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  DateTime? date,
  Color? bgColor,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'bgColor': bgColor,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        listEquality.equals(e1?.guests, e2?.guests) &&
        e1?.bgColor == e2?.bgColor &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.areasRef, e2?.areasRef) &&
        listEquality.equals(e1?.imgUrls, e2?.imgUrls) &&
        listEquality.equals(e1?.imgPaths, e2?.imgPaths);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.guests,
        e?.bgColor,
        e?.location,
        e?.areasRef,
        e?.imgUrls,
        e?.imgPaths
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
