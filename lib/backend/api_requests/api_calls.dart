import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetBancosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBancos',
      apiUrl:
          'https://cap-dev-gateway-api.azure-api.net/nscap-cadastro/api/Banco',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '4252baed-70e1-4610-b355-ef9f33de3467',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetBancoByIdCall {
  static Future<ApiCallResponse> call({
    int? idBanco = 1,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBancoById',
      apiUrl:
          'https://cap-dev-gateway-api.azure-api.net/nscap-cadastro/api/Banco/${idBanco}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '4252baed-70e1-4610-b355-ef9f33de3467',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostBancoCall {
  static Future<ApiCallResponse> call({
    int? id = -1,
    String? nome = '',
    int? numero,
    int? digito,
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id},
  "nome": "${nome}",
  "numero": ${numero},
  "digito": ${digito}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postBanco',
      apiUrl:
          'https://cap-dev-gateway-api.azure-api.net/nscap-cadastro/api/Banco',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '4252baed-70e1-4610-b355-ef9f33de3467',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PutBancoCall {
  static Future<ApiCallResponse> call({
    int? idBanco,
    int? numero,
    String? nome = '',
    int? digito,
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${idBanco},
  "numero": ${numero},
  "nome": "${nome}",
  "digito": ${digito}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'putBanco',
      apiUrl:
          'https://cap-dev-gateway-api.azure-api.net/nscap-cadastro/api/Banco/${idBanco}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '4252baed-70e1-4610-b355-ef9f33de3467',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
