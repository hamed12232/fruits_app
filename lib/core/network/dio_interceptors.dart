// import 'dart:developer';

// import 'package:dio/dio.dart';

// class DioInterceptors {
//   final Dio dio;
//   DioInterceptors(this.dio);
//   InterceptorsWrapper get interceptor => InterceptorsWrapper(
//     onRequest: (options, handler) async {
//       final accessToken = await CacheHelper.getData(key: ApiKeys.accessToken);
//       if (accessToken != null) {
//         options.headers['Authorization'] = 'Bearer $accessToken';
//         log("📤 Sending request with token: Bearer $accessToken");
//       }
//       return handler.next(options); //continue
//     },

//     onError: (DioException e, handler) async {
//       if (e.response?.statusCode == 401) {
//         final refreshed = await _refreshAccessToken();
//         if (refreshed) {
//           // 🟡 لو التجديد نجح → عيد الطلب بنفس الـ Access Token الجديد
//           final newToken = await CacheHelper.getData(key: ApiKeys.accessToken);
//           final requestOptions = e.requestOptions;
//           requestOptions.headers["Authorization"] = "Bearer $newToken";

//           final response = await dio.fetch(requestOptions);
//           return handler.resolve(response);
//         }
//       }
//       return handler.next(e);
//     },
//   );

//   Future<bool> _refreshAccessToken() async {
//     try {
//       final refreshToken = await CacheHelper.getData(key: ApiKeys.refreshToken);
//       if (refreshToken == null) return false;

//       final response = await dio.post(
//         ApiConstance.generateNewAccessToken,
//         data: {
//           ApiKeys.refreshToken: refreshToken,
//         },
//       );

//       final newAccessToken = response.data.toString();

//       // 📝 خزّن التوكنات الجديدة
//       await CacheHelper.saveData(
//         key: ApiKeys.accessToken,
//         value: newAccessToken,
//       );
//       log("✅ Token refreshed successfully $newAccessToken");

//       return true;
//     } catch (e) {
//       log("❌ Refresh failed: $e");
//       return false;
//     }
//   }
// }
