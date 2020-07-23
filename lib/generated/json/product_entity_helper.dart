import 'package:product_app/model/product/product_model.dart';

productEntityFromJson(ProductModel data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toString();
  }
  if (json['images'] != null) {
    data.images = new List<ProductImage>();
    (json['images'] as List).forEach((v) {
      data.images.add(new ProductImage().fromJson(v));
    });
  }
  if (json['title'] != null) {
    data.title = json['title']?.toString();
  }
  if (json['slug'] != null) {
    data.slug = json['slug']?.toString();
  }
  if (json['price'] != null) {
    data.price = json['price']?.toInt();
  }
  if (json['condition'] != null) {
    data.condition = json['condition']?.toString();
  }
  if (json['location'] != null) {
    data.location = new ProductLocation().fromJson(json['location']);
  }
  if (json['status'] != null) {
    data.status = json['status']?.toString();
  }
  if (json['is_commentable'] != null) {
    data.isCommentable = json['is_commentable'];
  }
  if (json['is_offerable'] != null) {
    data.isOfferable = json['is_offerable'];
  }
  if (json['is_liked'] != null) {
    data.isLiked = json['is_liked'];
  }
  if (json['views_count'] != null) {
    data.viewsCount = json['views_count']?.toInt();
  }
  if (json['likes_count'] != null) {
    data.likesCount = json['likes_count']?.toInt();
  }
  if (json['comments_count'] != null) {
    data.commentsCount = json['comments_count']?.toInt();
  }
  if (json['rooms_count'] != null) {
    data.roomsCount = json['rooms_count']?.toInt();
  }
  if (json['offers_count'] != null) {
    data.offersCount = json['offers_count']?.toInt();
  }
  if (json['pushes_count'] != null) {
    data.pushesCount = json['pushes_count']?.toInt();
  }
  if (json['edit_count'] != null) {
    data.editCount = json['edit_count']?.toInt();
  }
  if (json['url'] != null) {
    data.url = json['url']?.toString();
  }
  if (json['accepted_at'] != null) {
    data.acceptedAt = json['accepted_at']?.toString();
  }
  if (json['last_pushed_at'] != null) {
    data.lastPushedAt = json['last_pushed_at'];
  }
  if (json['ordering_timestamp'] != null) {
    data.orderingTimestamp = json['ordering_timestamp']?.toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at']?.toString();
  }
  if (json['updated_at'] != null) {
    data.updatedAt = json['updated_at']?.toString();
  }
  if (json['owner'] != null) {
    data.owner = new ProductOwner().fromJson(json['owner']);
  }
  if (json['user'] != null) {
    data.user = new ProductUser().fromJson(json['user']);
  }
  if (json['category'] != null) {
    data.category = new ProductCategory().fromJson(json['category']);
  }
  if (json['description'] != null) {
    data.description = json['description']?.toString();
  }
  if (json['user_last_views_count'] != null) {
    data.userLastViewsCount = json['user_last_views_count']?.toInt();
  }
  if (json['user_last_view_at'] != null) {
    data.userLastViewAt = json['user_last_view_at'];
  }
  return data;
}

Map<String, dynamic> productEntityToJson(ProductModel entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['type'] = entity.type;
  if (entity.images != null) {
    data['images'] = entity.images.map((v) => v.toJson()).toList();
  }
  data['title'] = entity.title;
  data['slug'] = entity.slug;
  data['price'] = entity.price;
  data['condition'] = entity.condition;
  if (entity.location != null) {
    data['location'] = entity.location.toJson();
  }
  data['status'] = entity.status;
  data['is_commentable'] = entity.isCommentable;
  data['is_offerable'] = entity.isOfferable;
  data['is_liked'] = entity.isLiked;
  data['views_count'] = entity.viewsCount;
  data['likes_count'] = entity.likesCount;
  data['comments_count'] = entity.commentsCount;
  data['rooms_count'] = entity.roomsCount;
  data['offers_count'] = entity.offersCount;
  data['pushes_count'] = entity.pushesCount;
  data['edit_count'] = entity.editCount;
  data['url'] = entity.url;
  data['accepted_at'] = entity.acceptedAt;
  data['last_pushed_at'] = entity.lastPushedAt;
  data['ordering_timestamp'] = entity.orderingTimestamp;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  if (entity.owner != null) {
    data['owner'] = entity.owner.toJson();
  }
  if (entity.user != null) {
    data['user'] = entity.user.toJson();
  }
  if (entity.category != null) {
    data['category'] = entity.category.toJson();
  }
  data['description'] = entity.description;
  data['user_last_views_count'] = entity.userLastViewsCount;
  data['user_last_view_at'] = entity.userLastViewAt;
  return data;
}

productImageFromJson(ProductImage data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['url'] != null) {
    data.url = json['url']?.toString();
  }
  if (json['urls'] != null) {
    data.urls = new ProductImagesUrls().fromJson(json['urls']);
  }
  if (json['is_top'] != null) {
    data.isTop = json['is_top'];
  }
  return data;
}

Map<String, dynamic> productImageToJson(ProductImage entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['url'] = entity.url;
  if (entity.urls != null) {
    data['urls'] = entity.urls.toJson();
  }
  data['is_top'] = entity.isTop;
  return data;
}

productImagesUrlsFromJson(ProductImagesUrls data, Map<String, dynamic> json) {
  if (json['large'] != null) {
    data.large = json['large']?.toString();
  }
  if (json['small'] != null) {
    data.small = json['small']?.toString();
  }
  return data;
}

Map<String, dynamic> productImagesUrlsToJson(ProductImagesUrls entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['large'] = entity.large;
  data['small'] = entity.small;
  return data;
}

productLocationFromJson(ProductLocation data, Map<String, dynamic> json) {
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['latitude'] != null) {
    data.latitude = json['latitude']?.toDouble();
  }
  if (json['longitude'] != null) {
    data.longitude = json['longitude']?.toDouble();
  }
  return data;
}

Map<String, dynamic> productLocationToJson(ProductLocation entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = entity.name;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  return data;
}

productOwnerFromJson(ProductOwner data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['picture'] != null) {
    data.picture = json['picture']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['location'] != null) {
    data.location = new ProductOwnerLocation().fromJson(json['location']);
  }
  if (json['score'] != null) {
    data.score = json['score']?.toInt();
  }
  if (json['response_rate'] != null) {
    data.responseRate = json['response_rate']?.toDouble();
  }
  if (json['satisfaction_rate'] != null) {
    data.satisfactionRate = json['satisfaction_rate'];
  }
  if (json['is_following'] != null) {
    data.isFollowing = json['is_following'];
  }
  if (json['is_follower'] != null) {
    data.isFollower = json['is_follower'];
  }
  if (json['is_blocked'] != null) {
    data.isBlocked = json['is_blocked'];
  }
  if (json['items_count'] != null) {
    data.itemsCount =
        new ProductOwnerItemsCount().fromJson(json['items_count']);
  }
  return data;
}

Map<String, dynamic> productOwnerToJson(ProductOwner entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['picture'] = entity.picture;
  data['name'] = entity.name;
  if (entity.location != null) {
    data['location'] = entity.location.toJson();
  }
  data['score'] = entity.score;
  data['response_rate'] = entity.responseRate;
  data['satisfaction_rate'] = entity.satisfactionRate;
  data['is_following'] = entity.isFollowing;
  data['is_follower'] = entity.isFollower;
  data['is_blocked'] = entity.isBlocked;
  if (entity.itemsCount != null) {
    data['items_count'] = entity.itemsCount.toJson();
  }
  return data;
}

productOwnerLocationFromJson(
    ProductOwnerLocation data, Map<String, dynamic> json) {
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['latitude'] != null) {
    data.latitude = json['latitude']?.toDouble();
  }
  if (json['longitude'] != null) {
    data.longitude = json['longitude']?.toDouble();
  }
  return data;
}

Map<String, dynamic> productOwnerLocationToJson(ProductOwnerLocation entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = entity.name;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  return data;
}

productOwnerItemsCountFromJson(
    ProductOwnerItemsCount data, Map<String, dynamic> json) {
  if (json['for_sale'] != null) {
    data.forSale = json['for_sale']?.toInt();
  }
  if (json['not_for_sale'] != null) {
    data.notForSale = json['not_for_sale']?.toInt();
  }
  return data;
}

Map<String, dynamic> productOwnerItemsCountToJson(
    ProductOwnerItemsCount entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['for_sale'] = entity.forSale;
  data['not_for_sale'] = entity.notForSale;
  return data;
}

productUserFromJson(ProductUser data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['picture'] != null) {
    data.picture = json['picture']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['location'] != null) {
    data.location = new ProductUserLocation().fromJson(json['location']);
  }
  if (json['score'] != null) {
    data.score = json['score']?.toInt();
  }
  if (json['response_rate'] != null) {
    data.responseRate = json['response_rate']?.toDouble();
  }
  if (json['satisfaction_rate'] != null) {
    data.satisfactionRate = json['satisfaction_rate'];
  }
  if (json['is_following'] != null) {
    data.isFollowing = json['is_following'];
  }
  if (json['is_follower'] != null) {
    data.isFollower = json['is_follower'];
  }
  if (json['is_blocked'] != null) {
    data.isBlocked = json['is_blocked'];
  }
  if (json['items_count'] != null) {
    data.itemsCount = new ProductUserItemsCount().fromJson(json['items_count']);
  }
  return data;
}

Map<String, dynamic> productUserToJson(ProductUser entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['picture'] = entity.picture;
  data['name'] = entity.name;
  if (entity.location != null) {
    data['location'] = entity.location.toJson();
  }
  data['score'] = entity.score;
  data['response_rate'] = entity.responseRate;
  data['satisfaction_rate'] = entity.satisfactionRate;
  data['is_following'] = entity.isFollowing;
  data['is_follower'] = entity.isFollower;
  data['is_blocked'] = entity.isBlocked;
  if (entity.itemsCount != null) {
    data['items_count'] = entity.itemsCount.toJson();
  }
  return data;
}

productUserLocationFromJson(
    ProductUserLocation data, Map<String, dynamic> json) {
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['latitude'] != null) {
    data.latitude = json['latitude']?.toDouble();
  }
  if (json['longitude'] != null) {
    data.longitude = json['longitude']?.toDouble();
  }
  return data;
}

Map<String, dynamic> productUserLocationToJson(ProductUserLocation entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = entity.name;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  return data;
}

productUserItemsCountFromJson(
    ProductUserItemsCount data, Map<String, dynamic> json) {
  if (json['for_sale'] != null) {
    data.forSale = json['for_sale']?.toInt();
  }
  if (json['not_for_sale'] != null) {
    data.notForSale = json['not_for_sale']?.toInt();
  }
  return data;
}

Map<String, dynamic> productUserItemsCountToJson(ProductUserItemsCount entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['for_sale'] = entity.forSale;
  data['not_for_sale'] = entity.notForSale;
  return data;
}

productCategoryFromJson(ProductCategory data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['slug'] != null) {
    data.slug = json['slug']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['icon_url'] != null) {
    data.iconUrl = json['icon_url']?.toString();
  }
  return data;
}

Map<String, dynamic> productCategoryToJson(ProductCategory entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['slug'] = entity.slug;
  data['name'] = entity.name;
  data['icon_url'] = entity.iconUrl;
  return data;
}
