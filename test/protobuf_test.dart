import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import '../proto/address.pb.dart';

void main() {
  test('protobuf', () {
    SearchRequest searchRequest = new SearchRequest();
    searchRequest.query = 'hello, query';
    searchRequest.pageNumber = 100;
    
    assert(searchRequest.query == 'hello, query');
    assert(searchRequest.hasPageNumber());
    assert(!searchRequest.hasResultPerPage());

    Uint8List buffer = searchRequest.writeToBuffer();
    SearchRequest newSearchResult = SearchRequest.fromBuffer(buffer);
    
    assert(newSearchResult.query == 'hello, query');
    assert(newSearchResult.hasPageNumber());
    assert(!newSearchResult.hasResultPerPage());
  });
}