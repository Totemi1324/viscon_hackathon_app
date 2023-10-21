enum LearningMethod {
  none,
  workTogether,
  workAlone,
  recapLecture,
  solveExercises,
  compareWork,
  explainMaterial
}

String learningMethodToString(LearningMethod method) {
  switch (method) {
    case LearningMethod.none:
      return "NaN";
    case LearningMethod.workTogether:
      return "work together";
    case LearningMethod.workAlone:
      return "work individually";
    case LearningMethod.recapLecture:
      return "recap lectures";
    case LearningMethod.solveExercises:
      return "solve exercises";
    case LearningMethod.compareWork:
      return "compare work";
    case LearningMethod.explainMaterial:
      return "explain material";
    default:
      return "NaN";
  }
}
