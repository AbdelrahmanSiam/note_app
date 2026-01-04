import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/core/models/note_model.dart';
import 'package:note_app/core/utils/hive_service.dart';
import 'package:note_app/features/notes/data/repo/note_repo.dart';
import 'package:note_app/features/notes/data/repo/note_repo_implementaion.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  var notesBoxx = Hive.box<NoteModel>(notesBox);
  getIt.registerSingleton(HiveService(notesBox: notesBoxx));

  getIt.registerSingleton<NoteRepo>(
      NoteRepoImplementaion(hiveService: getIt.get<HiveService>(),),);
}
