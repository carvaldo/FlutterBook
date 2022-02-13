import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'database.g.dart';

const tableNote = SqfEntityTable(
  tableName: "note",
  primaryKeyName: "id",
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: false,
  modelName: "Note",
  fields: [
    SqfEntityField("title", DbType.text),
    SqfEntityField("content", DbType.text),
    SqfEntityField("color", DbType.text),
  ]
);
// View Sample:
// const tableV_tracks = SqfEntityTable(
//   tableName: 'VTracks',
//   objectType: ObjectType.view,
//   fields: [
//     SqfEntityField('Name', DbType.text),
//     SqfEntityField('album', DbType.text),
//     SqfEntityField('media', DbType.text),
//     SqfEntityField('genres', DbType.text),
//     SqfEntityFieldRelationship(
//         parentTable: tableTrack,
//         deleteRule: DeleteRule.NO_ACTION,
//         fieldName: 'TrackId',
//         isPrimaryKeyField: false),
//   ],
//   sqlStatement: '''SELECT
//         trackid,
//         track.name,
//         album.Title AS album,
//         mediatype.Name AS media,
//         genre.Name AS genres
//     FROM
//         track
//     INNER JOIN album ON Album.AlbumId = track.AlbumId
//     INNER JOIN mediatype ON mediatype.MediaTypeId = track.MediaTypeId
//     INNER JOIN genre ON genre.GenreId = track.GenreId''',
// );

@SqfEntityBuilder(dbModel)
const dbModel = SqfEntityModel(
  databaseName: "flutter_book.db",
  modelName: "flutter_book",
  password: null, // You can set a password if yout want to use crypted database.
  databaseTables: [tableNote],
  bundledDatabasePath: null,// 'assets/sample.db' // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
  dbVersion: 1,
);