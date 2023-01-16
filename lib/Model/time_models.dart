class TimeModel {
  String? datetime;
  String? utcOffset;
  String? timezone;

  TimeModel({
    this.datetime,
    this.timezone,
    this.utcOffset,
  });

  TimeModel.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    timezone = json['timezone'];
    utcOffset = json['utc_offset'];
  }

 /*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['timezone'] = this.timezone;
    data['utc_offset'] = this.utcOffset;
    return data;
  } */
}
