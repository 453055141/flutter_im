import 'package:flutter_im/models/menu/countrys_entity.dart';

countrysEntityFromJson(CountrysEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toDouble();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> countrysEntityToJson(CountrysEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}