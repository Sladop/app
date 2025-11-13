class Step {
  final String name;
  final String description;
  final int repetitions;

  Step({
    required this.name,
    required this.description,
    required this.repetitions,
  });
}

class Experiment {
  final String name;
  final String description;
  final List<Step> steps = [];
  int? id;

  Experiment({
    required this.name,
    required this.description,
    this.id,
  });
}