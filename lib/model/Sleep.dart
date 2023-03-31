class SleepCycle {
  final DateTime startTime;
  final DateTime endTime;
  final List<SleepPhase> phases;

  SleepCycle(this.startTime, this.endTime, this.phases);


}

class SleepPhase {
  final SleepPhaseType type;
  final Duration duration;

  SleepPhase(this.type, this.duration);
}

enum SleepPhaseType {
  light,
  deep,
  paradoxical,
}
