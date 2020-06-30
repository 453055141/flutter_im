import 'package:flutter_im/generated/json/base/json_convert_content.dart';

class UserInfoEntity with JsonConvert<UserInfoEntity> {
	String gender;
	String id;
	String name;
	String phone;
	String token;
}
