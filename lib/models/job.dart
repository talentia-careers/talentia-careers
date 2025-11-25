class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String type; // Full-time, Part-time, Contract, etc.
  final String description;
  final List<String> requirements;
  final String salary;
  final String postedDate;
  final String googleFormLink;
  final bool isActive;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.description,
    required this.requirements,
    required this.salary,
    required this.postedDate,
    required this.googleFormLink,
    this.isActive = true,
  });

  factory Job.fromFirestore(Map<String, dynamic> data, String id) {
    return Job(
      id: id,
      title: data['title'] ?? '',
      company: data['company'] ?? '',
      location: data['location'] ?? '',
      type: data['type'] ?? '',
      description: data['description'] ?? '',
      requirements: List<String>.from(data['requirements'] ?? []),
      salary: data['salary'] ?? '',
      postedDate: data['postedDate'] ?? '',
      googleFormLink: data['googleFormLink'] ?? '',
      isActive: data['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'company': company,
      'location': location,
      'type': type,
      'description': description,
      'requirements': requirements,
      'salary': salary,
      'postedDate': postedDate,
      'googleFormLink': googleFormLink,
      'isActive': isActive,
    };
  }
}