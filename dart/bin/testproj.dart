import 'package:testproj/api/base_client.dart';
import 'package:testproj/api/client.dart';
import 'package:testproj/api/types.dart';

void main(List<String> arguments) async {
  final client = ApiClient(baseUrl: "http://localhost:1337");
  client.headers["Authorization"] = "Bearer testtoken";

  final url = client.url.test("123");
  print("Url: $url");

  final res = await client.test(
    "123",
    LelBody(
      username: "testuser",
      password: "password",
      confirmPassword: "password",
    ),
    options: RequestOptions(headers: {"Authorization": "boom"}),
  );
  print("Res: $res");
}
