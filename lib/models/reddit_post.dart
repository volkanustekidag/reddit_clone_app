class RedditPost {
  String kind;
  Data data;

  RedditPost({this.kind, this.data});

  RedditPost.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  var after;
  int dist;
  String modhash;
  String geoFilter;
  List<Children> children;
  String before;

  Data(
      {this.after,
      this.dist,
      this.modhash,
      this.geoFilter,
      this.children,
      this.before});

  Data.fromJson(Map<String, dynamic> json) {
    after = json['after'];
    dist = json['dist'];
    modhash = json['modhash'];
    geoFilter = json['geo_filter'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
    before = json['before'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['after'] = this.after;
    data['dist'] = this.dist;
    data['modhash'] = this.modhash;
    data['geo_filter'] = this.geoFilter;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    data['before'] = this.before;
    return data;
  }
}

class Children {
  String kind2;
  Data2 data2;

  Children({this.kind2, this.data2});

  Children.fromJson(Map<String, dynamic> json) {
    kind2 = json['kind'];
    data2 = json['data'] != null ? new Data2.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind2;
    if (this.data2 != null) {
      data['data'] = this.data2.toJson();
    }
    return data;
  }
}

class Data2 {
  String title;
  String thumbnail;

  Data2({this.title, this.thumbnail});

  Data2.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
