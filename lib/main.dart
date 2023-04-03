import 'package:flutter/material.dart';
import 'package:http_app/post_repository.dart';
import 'package:http_app/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Future<Post> download() async{
  //   PostRepository postRepository = PostRepository();
  //   Post post = await postRepository.findById(1);
  //   return post;
  // }

  @override
  Widget build(BuildContext context) { //위젯은 비동기로 그리면 안되기 때문에 asyn 붙이면 안됨
    print("나도 실행 된다.");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // child: Container(
              //   // download() // 이거 안됨
              // ),
              child: FutureBuilder(
                future: PostRepository().findById(1),
                builder: (context, snapshot) {
                  //snapshot 이 존재 할 때 return을 해줄것.
                  //존재 하지 않으면 로딩 아바타를 보여 줄 것
                  if(snapshot.hasData){
                    print("데이터 있음");
                    Post post = snapshot.data!;
                    return Center(
                      child: Text(
                        "${post.title}",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    );
                  }else{
                    print("데이터 없음");
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: PostRepository().findAll(),
                builder:(context, snapshot) {
                  if(snapshot.hasData){
                    // List<Post> postList = snapshot.data ?? [];
                    List<Post> postList = snapshot.data!;
                    return ListView.separated(
                      itemCount: postList.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 1,
                        );
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.ac_unit_outlined),
                          title: Text("${postList[index].title}"),
                          subtitle: Text("${postList[index].body}"),
                        );
                      },
                    );

                  }else{
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
