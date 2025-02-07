part of 'task_cubit.dart';

class TaskState extends Equatable {
  const TaskState({
    required this.tasks,
    required this.status,
    required this.count,
    this.errorMessage,
    this.actionMessage,
  });

  final List<Task> tasks;

  final FormStatus status;
  final String? errorMessage;
  final String? actionMessage;
  final int count;

  TaskState copyWith({
    List<Task>? tasks,
    FormStatus? status,
    String? errorMessage,
    String? actionMessage,
    int? count,
  }) =>
      TaskState(
        tasks: tasks ?? this.tasks,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        actionMessage: actionMessage ?? this.actionMessage,
        count: count ?? this.count,
      );

  @override
  List<Object?> get props => [
        tasks,
        status,
        errorMessage,
        actionMessage,
        count,
      ];
}
