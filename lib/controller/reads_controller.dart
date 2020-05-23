import 'package:simple_api/simple_api.dart';

import '../model/read.dart';

List<Read> reads = [
  Read()..readFromMap({
    "title":"Noticia Geral 1",
    "author":"Davi Lhlapak Rosa",
    "year":2020
  }),
  Read()..readFromMap({
    "title":"Noticia Jogos 2",
    "author":"Davi Lhlapak Rosa",
    "year":2008
  }),
];

class ReadsController extends ResourceController{

  @Operation.get()
  Future<Response> getAllReads() async {
    return Response.ok(reads);
  }

  @Operation.get('id')
  Future<Response> getRead(@Bind.path('id') int id) async{
    if(id < 0 || id > reads.length - 1){
      return Response.notFound(body: "Item not found.");
    }

    return Response.ok(reads[id]);
  }

  @Operation.post()
  Future<Response> addRead(@Bind.body() Read body)async{
    reads.add(body);
    return Response.ok(body);
  }

  @Operation.put('id')
  Future<Response> updateRead(@Bind.path('id') int id, @Bind.body() Read body)async{
    if(id < 0 || id > reads.length - 1){
      return Response.notFound(body: "Item not found.");
    }

    reads[id] = body;

    return Response.ok(body);
  }

  @Operation.delete('id')
  Future<Response> deleteRead(@Bind.path('id') int id)async{
    if(id < 0 || id > reads.length - 1){
      return Response.notFound(body: "Item not found.");
    }

    reads.removeAt(id);
    return Response.ok("Deleted read.");
  }
}