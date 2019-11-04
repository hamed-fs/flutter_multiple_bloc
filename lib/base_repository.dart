abstract class BaseRepository {
  Future<String> getData(String data);
}

class FakeRepository implements BaseRepository {
  @override
  Future<String> getData(String data) {
    return Future<String>.delayed(Duration(seconds: 3), () {
      return 'RESULT FROM $data';
    });
  }
}
