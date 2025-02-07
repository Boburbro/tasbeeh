import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasbeeh/data/models/form_status.dart';
import 'package:tasbeeh/data/models/task_model.dart';
import 'package:tasbeeh/data/network/app_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final AppRepository appRepository;

  TaskCubit({
    required this.appRepository,
  }) : super(TaskState(status: FormStatus.pure, tasks: [], count: 0));

  void incrementCount() {
    emit(state.copyWith(count: state.count + 1));
  }

  Future<void> loadTasks() async {
    emit(state.copyWith(
      status: FormStatus.submissionInProgress,
    ));
    try {
      List<Task> _tasks = await appRepository.loadTasks();
      emit(state.copyWith(
        tasks: _tasks,
        status: FormStatus.submissionSuccess,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FormStatus.submissionFailure,
        errorMessage: e.toString(),
      ));
    }
  }
}
