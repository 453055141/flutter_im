import 'package:flutter_im/models/login/login_req_entity.dart';

loginReqEntityFromJson(LoginReqEntity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone']?.toString();
	}
	return data;
}

Map<String, dynamic> loginReqEntityToJson(LoginReqEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['phone'] = entity.phone;
	return data;
}