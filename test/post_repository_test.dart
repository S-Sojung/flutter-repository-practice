
import 'package:dio/dio.dart';
import 'package:http_app/post_repository.dart';

// void main() async{
//   // Dio dio = Dio();
//   // Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/2");
//   // print(response.data);
//
//   PostRepository postRepository = PostRepository();
//   await postRepository.findById(1);
//
//   //실행이 종료될 때 까지 기다렸다가 가고싶음 -> async , await
//   //하지만 await로 기다리고 싶으면 Future 타입으로 받아야함.
// }

void main() async{
  await findById_test();
  // await findAll_test();
}

//await로 기다리려면 Future로 리턴해야한다.
Future<void> findById_test() async{
  //given
  int id = 1;

  //when
  PostRepository postRepository = PostRepository();
  await postRepository.findById(id);

  //then
}

//await로 기다리려면 Future로 리턴해야한다.
Future<void> findAll_test() async{
  //given

  //when
  PostRepository postRepository = PostRepository();
  await postRepository.findAll();

  //then
}