class Chapter {
  String title;
  String subject;

  Chapter({required this.title, required this.subject});

  static List<Chapter> getChapters() {
    return <Chapter>[
      Chapter(title: "Introduction to Algebra", subject: "Maths"),
      Chapter(title: "Trigonometry", subject: "Maths"),
      Chapter(title: "Mechanics", subject: "Physics"),
      Chapter(title: "Electricity and Magnetism", subject: "Physics"),
      Chapter(title: "Chemical Bonding", subject: "Biology")
    ];
  }
}
