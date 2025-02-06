import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final int planDay;
  final int count;
  final String title;
  final String? description;
  final DateTime startTime;
  final DateTime endTime;

  const Task({
    this.id,
    required this.planDay,
    this.count = 0,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
  });

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      planDay: map['plan_day'] as int,
      count: map['count'] as int? ?? 0,
      title: map['title'] as String,
      description: map['description'] as String?,
      startTime: DateTime.parse(map['start_time'] as String),
      endTime: DateTime.parse(map['end_time'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'plan_dat': planDay,
      'count': count,
      'title': title,
      'description': description,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Task copyWith({
    int? id,
    int? planDay,
    int? count,
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return Task(
      id: id ?? this.id,
      planDay: planDay ?? this.planDay,
      count: count ?? this.count,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  static Task get empty => Task(
        id: null,
        planDay: 0,
        count: 0,
        title: "",
        description: "",
        startTime: DateTime.fromMillisecondsSinceEpoch(0),
        endTime: DateTime.fromMillisecondsSinceEpoch(0),
      );

  @override
  String toString() {
    return '''Task{
    id: $id, planDay: $planDay, 
    count: $count, title: $title, 
    description: $description, 
    startTime: $startTime, endTime: $endTime}
  ''';
  }

  @override
  List<Object?> get props => [
        id,
        planDay,
        count,
        title,
        description,
        startTime,
        endTime,
      ];
}
