import 'package:tasbeeh/data/models/task_model.dart';

import '../local/local_database_service.dart';

class AppRepository {
  final _dbService = LocalDatabaseService();

  Future<void> createData(Task task) async {
    await _dbService.insert(task.toJson());
  }

  Future<List<Task>> loadTasks() async {
    try {
      var tasks = await _dbService.queryAll();
      return Task.fromList(tasks);
    } catch (e) {
      rethrow;
    }
  }
}
