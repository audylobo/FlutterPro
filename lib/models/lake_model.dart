class LakeModel {
  String lakeName;
  String oxigenSendorId;
  String phSensorId;
  String tempSensorId;
  String waterLevelSensorId;

  LakeModel({this.lakeName = '', this.oxigenSendorId = '', this.phSensorId = '', this.tempSensorId = '', this.waterLevelSensorId = ''});

  Map<String, dynamic> toMap() {
    return {
      'lakeName': lakeName,
      'oxigenSendorId': oxigenSendorId,
      'phSensorId': phSensorId,
      'tempSensorId': tempSensorId,
      'waterLevelSensorId': waterLevelSensorId
    };
  }
}