import 'package:product_app/generated/json/base/json_convert_content.dart';
import 'package:product_app/generated/json/base/json_filed.dart';

class ProductModel with JsonConvert<ProductModel> {
  int id;
  String type;
  List<ProductImage> images;
  String title;
  String slug;
  int price;
  String condition;
  ProductLocation location;
  String status;
  @JSONField(name: "is_commentable")
  bool isCommentable;
  @JSONField(name: "is_offerable")
  bool isOfferable;
  @JSONField(name: "is_liked")
  bool isLiked;
  @JSONField(name: "views_count")
  int viewsCount;
  @JSONField(name: "likes_count")
  int likesCount;
  @JSONField(name: "comments_count")
  int commentsCount;
  @JSONField(name: "rooms_count")
  int roomsCount;
  @JSONField(name: "offers_count")
  int offersCount;
  @JSONField(name: "pushes_count")
  int pushesCount;
  @JSONField(name: "edit_count")
  int editCount;
  String url;
  @JSONField(name: "accepted_at")
  String acceptedAt;
  @JSONField(name: "last_pushed_at")
  dynamic lastPushedAt;
  @JSONField(name: "ordering_timestamp")
  String orderingTimestamp;
  @JSONField(name: "created_at")
  String createdAt;
  @JSONField(name: "updated_at")
  String updatedAt;
  ProductOwner owner;
  ProductUser user;
  ProductCategory category;
  String description;
  @JSONField(name: "user_last_views_count")
  int userLastViewsCount;
  @JSONField(name: "user_last_view_at")
  dynamic userLastViewAt;
}

class ProductImage with JsonConvert<ProductImage> {
  int id;
  String url;
  ProductImagesUrls urls;
  @JSONField(name: "is_top")
  bool isTop;
}

class ProductImagesUrls with JsonConvert<ProductImagesUrls> {
  String large;
  String small;
}

class ProductLocation with JsonConvert<ProductLocation> {
  String name;
  double latitude;
  double longitude;
}

class ProductOwner with JsonConvert<ProductOwner> {
  int id;
  String picture;
  String name;
  ProductOwnerLocation location;
  int score;
  @JSONField(name: "response_rate")
  double responseRate;
  @JSONField(name: "satisfaction_rate")
  dynamic satisfactionRate;
  @JSONField(name: "is_following")
  bool isFollowing;
  @JSONField(name: "is_follower")
  bool isFollower;
  @JSONField(name: "is_blocked")
  bool isBlocked;
  @JSONField(name: "items_count")
  ProductOwnerItemsCount itemsCount;
}

class ProductOwnerLocation with JsonConvert<ProductOwnerLocation> {
  String name;
  double latitude;
  double longitude;
}

class ProductOwnerItemsCount with JsonConvert<ProductOwnerItemsCount> {
  @JSONField(name: "for_sale")
  int forSale;
  @JSONField(name: "not_for_sale")
  int notForSale;
}

class ProductUser with JsonConvert<ProductUser> {
  int id;
  String picture;
  String name;
  ProductUserLocation location;
  int score;
  @JSONField(name: "response_rate")
  double responseRate;
  @JSONField(name: "satisfaction_rate")
  dynamic satisfactionRate;
  @JSONField(name: "is_following")
  bool isFollowing;
  @JSONField(name: "is_follower")
  bool isFollower;
  @JSONField(name: "is_blocked")
  bool isBlocked;
  @JSONField(name: "items_count")
  ProductUserItemsCount itemsCount;
}

class ProductUserLocation with JsonConvert<ProductUserLocation> {
  String name;
  double latitude;
  double longitude;
}

class ProductUserItemsCount with JsonConvert<ProductUserItemsCount> {
  @JSONField(name: "for_sale")
  int forSale;
  @JSONField(name: "not_for_sale")
  int notForSale;
}

class ProductCategory with JsonConvert<ProductCategory> {
  int id;
  String slug;
  String name;
  @JSONField(name: "icon_url")
  String iconUrl;
}
