import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';

class RemoteAuth {
  final HttClient httpClient;
  final String url;

  RemoteAuth({
    required this.httpClient,
    required this.url,
  });

  Future<void> auth() async {
    await httpClient.request(
      url: url,
      method: "post",
    );
  }
}

void main() {
  final httpClient = HttClientSpy();
  String? url;
  RemoteAuth? sut;
  setUp(() {
    // arrange
    url = faker.internet.httpUrl();
    sut = RemoteAuth(httpClient: httpClient, url: url ?? "");
  });
  test("Should call HttpClient with correct method", () async {
    // act
    await sut!.auth();
    // assert
    verify(httpClient.request(
      url: url ?? "",
      method: "post",
    ));
  });
}

abstract class HttClient {
  Future<void>? request({
    required String url,
    required String method,
  }) async {}
}

class HttClientSpy extends Mock implements HttClient {}
