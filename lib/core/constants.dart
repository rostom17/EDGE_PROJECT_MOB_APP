enum Status { complete, faield, pending }

enum Category { habit, quitHabit, repetingTask, soloTask }

enum SubCategory {
  study,
  meditation,
  prayer,
  exercise,
  sports,
  project,
  work,
  meeting,
  sleep,
  other,
}
const Map<SubCategory, String> categoryIcons = {
  SubCategory.study: "assets/categoryIcons/study.png",
  SubCategory.meditation: "assets/categoryIcons/meditation.png",
  SubCategory.prayer: "assets/categoryIcons/prayer.png",
  SubCategory.exercise: "assets/categoryIcons/excercise.png",
  SubCategory.sports: "assets/categoryIcons/sports.png",
  SubCategory.project: "assets/categoryIcons/project.png",
  SubCategory.work: "assets/categoryIcons/work.png",
  SubCategory.meeting: "assets/categoryIcons/meeting.png",
  SubCategory.sleep: "assets/categoryIcons/sleep.png",
};

String getCategoryIcons(SubCategory subCategory) {
  return categoryIcons[subCategory] ?? "assets/categoryIcons/other.png";
}
