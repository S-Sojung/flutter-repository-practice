import 'package:dio/dio.dart';
import 'package:http_app/post.dart';

class PostRepository{
  //다른 api에서 다 땡겨 올 것
  final dio = Dio();

  //싱글톤 패턴
  static final PostRepository _instance = PostRepository._single();

  PostRepository._single();
  factory PostRepository(){
    return _instance;
  }

  //우리는 River Pod를 사용할 것라 다운 받은 걸 Provider로 넣어줄 것이다.
  Future<Post> findById(int id) async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    // Map<String, dynamic> rsponseMap= response.data;
    // print(rsponseMap["userId"]);
    Post post = Post.fromJson(response.data);
    //await를 통해서 Future를 리턴함
    //통신해서 받은걸 창고에 넣어두고, 이 창고에 값이 바뀔 때마다 그림들에 적용된다.

    return post;
  }

  Future<List<Post>> findAll() async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts",);
    List<dynamic> responseBody = response.data;
    return responseBody.map((e) => Post.fromJson(e)).toList(); // 한바퀴 돌때 e에 map이 담긴다.
    //근데? 통신으로 받은 모든 데이터는 map으로 파싱해서 받음  => 이걸 object로 바꿔서 사용하면된다.
    //자바는 리플렉션을 통해서 하지만 다트는 리플렉션이 없음. 최소한 map으로 맞춰서 준것임
  }

  // void insert() {
  //   Map<String, dynamic> rsponseMap = Map();
  //   dio.post("주소",options: Options(contentType: "application/json; charset=utf-8", data: ));
  // }
}