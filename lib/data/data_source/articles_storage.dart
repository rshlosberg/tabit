// import 'dart:io';
//
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'package:sqlite3/sqlite3.dart';
// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
//
// part 'articles_storage.g.dart';
//
// @DriftDatabase(tables: [Articles])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase() : super(_openConnection());
//
//   @override
//   int get schemaVersion => 1;
// }
//
// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//
//     if (Platform.isAndroid) {
//       await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
//     }
//
//     final cachebase = (await getTemporaryDirectory()).path;
//     sqlite3.tempDirectory = cachebase;
//
//     return NativeDatabase.createInBackground(file);
//   });
// }
//
// class Articles extends Table {
//   TextColumn get sourceId => text().nullable()();
//
//   TextColumn get sourceName => text().nullable()();
//
//   TextColumn get author => text().nullable()();
//
//   TextColumn get title => text().nullable()();
//
//   TextColumn get description => text().nullable()();
//
//   TextColumn get url => text().nullable()();
//
//   TextColumn get urlToImage => text().nullable()();
//
//   DateTimeColumn get publishedAt => dateTime().nullable()();
//
//   TextColumn get content => text().nullable()();
// }
