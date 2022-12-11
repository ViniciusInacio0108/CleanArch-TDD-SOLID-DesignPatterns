import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';

class RemoteAuth {
  Future<void> auth() async {}
}

void main() {
  test("Should call HttpClient with correct URL", () async {
    // arrange
    final httpClient = HttClientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuth();
    // act
    await sut.auth();
    // assert
    verify(httpClient.request(url: url));
  });
}

abstract class HttClient {
  Future<void> request({required String url}) async {}
}

class HttClientSpy extends Mock implements HttClient {}
