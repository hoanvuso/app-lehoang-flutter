import 'dart:async';

import 'package:flutter_lehoang_extracare/data/local/pref/shared_preferences_provider.dart';
import 'package:flutter_lehoang_extracare/data/model/support/catalogue.dart';
import 'package:flutter_lehoang_extracare/data/provider/provider.dart';
import 'package:flutter_lehoang_extracare/data/repository/support/support_repository.dart';
import 'package:flutter_lehoang_extracare/resources/base/base_loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final catologueDetailViewModel = ChangeNotifierProvider.autoDispose((ref) => CatologueDetailViewModel(
      ref.read(prefsProvider),
      ref.read(supportRepositoryProvider),
    ));

class CatologueDetailViewModel extends BaseLoadingChangeNotifier {
  final PrefsProvider _prefsProvider;
  final SupportRepository _supportRepository;

  CatologueDetailViewModel(this._prefsProvider, this._supportRepository);

  String? linkCatalogue;

  void setLinkCatalogue(String? linkCatalogue) {
    this.linkCatalogue = linkCatalogue;
    notifyListeners();
  }

  Future<dynamic> loadCatalogueLink(int? id) async {
    // id : 1 bac, 2 trung, 3 nam
    final listCatalogue = await handleResultAPI<List<Catalogue>?>(_supportRepository.loadCatalogueList());
    final catalogue = listCatalogue?.firstWhere((element) => element.id == id, orElse: () => Catalogue());
    linkCatalogue = catalogue?.link;
    notifyListeners();
    return Future.value(linkCatalogue);
  }

// List<String?>? imageUrlList;
// int preloadCount = 0;
//
// void updatePreLoad() {
//   this.preloadCount = preloadCount + 1;
//   notifyListeners();
// }
//
// Future<dynamic> loadImageUrlList(int? id) async {
//   final listCatologueImage = await handleResultAPI<List<CatologueImage>?>(_supportRepository.loadCatologueImages(id));
//   imageUrlList = listCatologueImage?.map((e) => e.image_url).toList();
//
//   // imageUrlList = [
//   //   'https://media.ngoisao.vn/resize_580/news/2018/11/26/hotgirl-1-ngoisao.vn-w600-h493.jpg',
//   //   'https://i.vietgiaitri.com/2020/6/3/xinh-dep-lai-co-minh-day-cung-nguc-day-hotgirl-len-hinh-ben-bo-ma-bi-don-cap-dai-gia-19f-4981007.jpg',
//   //   'https://images.vietnamdaily.net.vn/zoomh/430/uploaded/nguyenanhson/2019_03_24/3/than-hinh-nong-bong-cua-hotgirl-dong-phuc-Hinh-2.jpg',
//   //   'https://gamek.mediacdn.vn/133514250583805952/2020/9/13/photo-1-15999725314761283427672.jpg',
//   //   'https://storage.oxii.vn/Cache/Sites/OXII/Storage/Images/2019/2/26/1920/ke-ni-nang-hotgirl-lanh-lung-khong-bao-gio-nhoen-mieng-cuoi-anh-2_957_651_82.jpg',
//   //   'https://we25.vn/media2018/Img_News/2019/06/27/loat-hotgirl-the-he-10x_20190627232253.jpg',
//   //   'https://streaming1.danviet.vn/upload/1-2020/images/2020-03-13/anh-17-1584088794-width650height768.jpg',
//   //   'https://media.doisongphapluat.com/684/2020/7/21/gai-xinh-tha-thinh-bang-nu-hon-ngot-ngao-nhieu-nam-sinh-hi-hung-cho-doi-va-cai-ket-cuoi-ra-nuoc-mat-dspl-1.jpg',
//   //   'https://1.bp.blogspot.com/-xmLV-ndC7M8/XszBqHMA_xI/AAAAAAAAmJA/53uO3K3Y9okVlMBsfqnQeFVp0DpxqcreQCLcBGAsYHQ/s1600/Anh-gai-xinh-deo-kinh%2B%252818%2529.jpg',
//   //   'https://hazomi.com/wp-content/uploads/2020/03/70616fe6ce53e9fedc661b4cbcf4234d.jpg',
//   //   'https://i.pinimg.com/564x/cf/e9/e5/cfe9e5abd920a3a57a90157febefe7b7.jpg',
//   //   // 'https://imagethumb.thethao247.vn/thumbamp/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
//   //   'https://2.bp.blogspot.com/-vKar87uxvs8/XbmBTGqKoCI/AAAAAAAAiZk/Hu2_QCjAnHImrasbFt4dv0CjxgGLGfUvACLcBGAsYHQ/s1600/gai-xinh-1.jpg',
//   //   'https://ttol.vietnamnetjsc.vn/images/2019/08/14/06/43/nu-dien-vien-phu-phim-Ve-nha-di-con-2.jpg',
//   //   'https://we25.vn/media2018/Img_News/2019/09/27/hoi-gai-xinh-viet-noi-tieng-mxh-trung-quoc-nguoi-nhan-sac-ngang-ngua-linh-ka-ke-thu-nhap-70-trieu-thang-1_20190927160054.jpg',
//   //   'https://2sao.vietnamnetjsc.vn/images/2016/10/29/11/08/hongngoc10.jpg',
//   //   "https://mcvideomd1fr.keeng.net/playnow/images/channel/avatar/20181109/0973824256_20181027032607.jpg",
//   //   'https://3.bp.blogspot.com/-Aee0g6oFj5M/WtP6rZqY4wI/AAAAAAAAACc/r6--Jq04HGMLDjjUMC7lW0ulvZeR6jYAQCLcBGAs/s1600/212310618041193431006884986278710988847462n-1507458620893.jpg',
//   // ];
//   notifyListeners();
//   return Future.value(imageUrlList);
// }
}
