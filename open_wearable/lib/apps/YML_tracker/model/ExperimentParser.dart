import 'dart:ffi';
import 'dart:io';
import 'package:open_wearable/apps/YML_tracker/model/Experiment/Experiment.dart';
import 'package:yaml/yaml.dart';


class ExperimentParser {

  YamlMap _loadYamlFile(String path) {
    var file = File(path);

    if (!file.existsSync()) {
      throw Exception('YAML-Datei existiert nicht: $path');
    }

    final yamlString = file.readAsStringSync();
    final yamlData = loadYaml(yamlString);

    if (yamlData is! YamlMap) {
      throw Exception('Die YAML-Datei Fehlerhaft');
    }

    return yamlData;
  }

  /// Parss path to instaz of Eexperiment with information providd in the YAML File of the path.
  ///
  /// Parameter:
  /// String path: pth to the YAML file that shoudl be converted.
  ///
  /// Rückgabewert:
  /// [void]
  void parseToExperiment(String path) {
    YamlMap map = _loadYamlFile(path);
    YamlMap processes = map['process'];
    List<Step> expSteps = [];
    processes.forEach((stepName, stepData) {
      final descr = stepData['description'];
      final rep = stepData['repetition'];
      
      expSteps.add(Step(name: stepName, description: descr, repetitions: rep));
    });
    Experiment(name: map['Exp'], description: map['Desc'], steps: expSteps);


  }

///   Exp: Test
///   Desc: Tst
///   Process:
///   Schritt1:
///     description: Links tippen
///     repetition: 4



}