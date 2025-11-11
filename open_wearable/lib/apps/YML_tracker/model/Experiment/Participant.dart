import 'package:uuid/uuid.dart';

class Participant {
  final String id;

  Participant._(this.id);

  factory Participant.generate() {
    return Participant._(Uuid().v4());
  }

  @override
  String toString() => '$id';

}