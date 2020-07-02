import 'package:flutter_im/models/menu/continent_and_ocean_entity.dart';

continentAndOceanEntityFromJson(ContinentAndOceanEntity data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> continentAndOceanEntityToJson(ContinentAndOceanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['name'] = entity.name;
	return data;
}