enum LearningMethod {
  none,
  workTogether,
  workAlone,
  recapLecture,
  solveExercises,
  compareWork,
  explainMaterial,
  learnTheory
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
    case LearningMethod.learnTheory:
      return "learn theory";
    default:
      return "NaN";
  }
}

LearningMethod fromString(String method) {
  switch (method) {
    case "compareWork":
      return LearningMethod.compareWork;
    case "exercises":
      return LearningMethod.solveExercises;
    case "learnTheory":
      return LearningMethod.learnTheory;
    case "lectureRecap":
      return LearningMethod.recapLecture;
    case "workTogether":
      return LearningMethod.workTogether;
    default:
      return LearningMethod.none;
  }
}
