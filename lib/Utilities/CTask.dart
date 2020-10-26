class Task {
  Task(this.date, this.startTime, this.endTime, this.title, this.description, this.location);

  DateTime date;
  int startTime, endTime;
  String title, description, location;

  Map<String, dynamic> toJson() {
    return {
      "date": this.date.toIso8601String(),
      "startTime": this.startTime,
      "endTime": this.endTime,
      "title": this.title,
      "description": this.description,
      "location": this.location,
    };
  }

  Task.fromJson(Map<String, dynamic> json) {
    this.date = DateTime.tryParse(json["date"]);
    this.startTime = json["startTime"];
    this.endTime = json["endTime"];
    this.title = json["title"];
    this.description = json["description"];
    this.location = json["description"];
  }
}