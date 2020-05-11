
import 'package:json_annotation/json_annotation.dart';

part 'noteForListing.g.dart';

@JsonSerializable()
class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastestEditDateTime;

  NoteForListing(
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.lastestEditDateTime});

  factory NoteForListing.formJson(Map<String, dynamic> item) =>_$NoteForListingFromJson(item);
}
