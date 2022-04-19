class Room {
  final String roomImage;
  final String roomName;
  final String roomConnectedDevices;

  Room(
    this.roomImage,
    this.roomName,
    this.roomConnectedDevices,
  );

  factory Room.fromJson(Map<String, dynamic> json) {
    return new Room(
      json["roomImage"],
      json["roomName"],
      json["roomConnectedDevices"],
    );
  }
}

class Devices {
  final String devicesName;
  final String devicesHomeImage;
  final String devicesConnectedDevices;

  Devices(
    this.devicesHomeImage,
    this.devicesName,
    this.devicesConnectedDevices,
  );

  factory Devices.fromJson(Map<String, dynamic> json) {
    return new Devices(
      json["devicesHomeImage"],
      json["devicesName"],
      json["devicesConnectedDevices"],
    );
  }
}
