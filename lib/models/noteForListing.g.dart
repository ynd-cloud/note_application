// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noteForListing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteForListing _$NoteForListingFromJson(Map<String, dynamic> json) {
  return NoteForListing(
    noteID: json['noteID'] as String,
    noteTitle: json['noteTitle'] as String,
    createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    lastestEditDateTime: json['lastestEditDateTime'] == null
        ? null
        : DateTime.parse(json['lastestEditDateTime'] as String),
  );
}

Map<String, dynamic> _$NoteForListingToJson(NoteForListing instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'noteTitle': instance.noteTitle,
      'createDateTime': instance.createDateTime?.toIso8601String(),
      'lastestEditDateTime': instance.lastestEditDateTime?.toIso8601String(),
    };
