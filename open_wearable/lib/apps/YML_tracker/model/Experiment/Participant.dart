class Participant {
  final String id;


  //Eindeutige ID Zuweisung
  factory Participant.generate() {
    final id = _generateRadomID();
  }

  static String _generateRandomID() {
    //mybe eeher nicht random, sondern eher per uuidv4 sonst kriese mit Dsgvo kram
  }

  @Override
  String toString() => '$id';

}