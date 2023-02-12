import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/news/new_object.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/news/news_repository.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsDetailViewModel = ChangeNotifierProvider.autoDispose((ref) => NewsDetailViewModel(
      ref.read(prefsProvider),
      ref.read(newsRepositoryProvider),
    ));

class NewsDetailViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final NewsRepository _newsRepository;

  NewsDetailViewModel(this._prefsProvider, this._newsRepository);

  NewObject? newObject;

  void loadDetailNews(int? id) async {
    if (id == null) return;
    final result = await handleResultAPI<NewObject>(_newsRepository.loadDetailNew(id));
    this.newObject = result;
    notifyListeners();
  }

  // void updateNewObject(NewObject? newObject) {
  //   this.newObject = newObject;
  //   if (newObject?.body == '<div class=\"ck-content\"><p><i>Website Giải pháp lưu trữ Giám sát Seagate với những thông tin hữu ích giúp khách hàng tối</i><br><i>ưu thời gian tìm hiểu sản phẩm SkyHawk, các công nghệ lưu trữ giám sát cũng như các dịch</i><br><i>vụ dẫn đầu về bảo hành và cứu dữ liệu.</i></p><img onclick=\"javascript:window.location=this.src;\"  src=\"http://lehoang.hoanvusolutions.com.vn/uploads/news_temp/bsryhuazlq-1626084456.jpeg\"> ><p><strong>Seagate</strong>, tập đoàn hàng đầu thế giới về các giải pháp quản lý và lưu trữ dữ liệu, vừa ra mắt<br>website chính thức cho dòng ổ cứng SkyHawk bằng tiếng Việt. Truy cập vào website, khách<br>hàng có thể tìm hiểu các thông tin về những giải pháp và sản phẩm lưu trữ cho ngành giám sát,<br>và tham khảo câu ch<mark class=\"marker-yellow\">uyện thành công cũng như các dịch </mark>vụ hỗ trợ gia tăng của Seagate. Thông<br>qua website này, khách hàng sẽ có được những trải nghiệm tốt hơn từ Seagate SkyHawk với sự<br>an tâm, nhanh chóng, thuận tiện và tối ưu chi phí.</p><ul><li>Sự an tâm: Khách hàng có thể truy cập các thông số kỹ thuật của sản phẩm cũng như các thông tin các đối tác chính thức của Seagate. Bên cạnh đó, những câu chuyện thành công của của khách hàng trên khắp thế giới cũng được chia sẻ để giúp khách hàng an tâm hơn trong việc sử dụng các giải pháp của Seagate.</li><li>Sự nhanh chóng: Các tin tức và chương trình khuyến mãi sẽ được cập nhật liên tục trên website để đảm bảo thông tin đến với khách hàng nhanh nhất có thể.</li><li>Sự thuận tiện: Thông qua website, khách hàng có thể dễ dàng lựa chọn loại camera giám sát phù hợp cho hệ thống cũng như liên hệ trực tiếp với các nhà phân phối chính hãng của ổ cứng Seagate SkyHawk trên toàn quốc. Khách hàng cũng có thể truy cập để liên hệ bảo hành hay đổi trả sản phẩm cũng như tìm kiếm các tài liệu về Dịch vụ cứu dữ liệu – một dịch vụ độc đáo mà Seagate đứng đầu.</li></ul><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">Tìm hiểu ngay sản phẩm SkyHawk của chúng tôi tại: https://nbg.seagate.com/vn-ocungskyhawk</span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">#SeagateSkyHawk #SkyHawkAI</span></p></div><link rel=\"stylesheet\" href=\"http://lehoang.hoanvusolutions.com.vn/plugins/custom/ckeditor/content-styles.css?v=4\" type=\"text/css\">') {
  //     print('truetruetruetruetruetruetruetruetruetruetruetruetruetrue');
  //   }else print('falsefalsefalsefalsefalsefalsefalsefalsefalsefalsefalse');
  //   notifyListeners();
  // }
}
