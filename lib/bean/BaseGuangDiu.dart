class BaseGuangDiu {
  String hottype;
  String status;
  List<DataListBean> data;

  BaseGuangDiu({this.hottype, this.status, this.data});

  BaseGuangDiu.fromJson(Map<String, dynamic> json) {    
    this.hottype = json['hottype'];
    this.status = json['status'];
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => DataListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hottype'] = this.hottype;
    data['status'] = this.status;
    data['data'] = this.data != null?this.data.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class DataListBean {
  String title;
  String image;
  String buyurl;
  int id;
  int iftobuy;

  DataListBean({this.title, this.image, this.buyurl, this.id, this.iftobuy});

  DataListBean.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.image = json['image'];
    this.buyurl = json['buyurl'];
    this.id = json['id'];
    this.iftobuy = json['iftobuy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['buyurl'] = this.buyurl;
    data['id'] = this.id;
    data['iftobuy'] = this.iftobuy;
    return data;
  }
}
