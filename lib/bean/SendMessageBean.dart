class SendMessageBean {
  DataBean data;
  ErrorBean error;

  SendMessageBean({this.data, this.error});

  SendMessageBean.fromJson(Map<String, dynamic> json) {    
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
    this.error = json['error'] != null ? ErrorBean.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'SendMessageBean{data: $data, error: $error}';
  }

}

class DataBean {
  bool success;

  DataBean({this.success});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }

  @override
  String toString() {
    return 'DataBean{success: $success}';
  }

}

class ErrorBean {
  String errorCode;
  String errorInfo;

  ErrorBean({this.errorCode, this.errorInfo});

  ErrorBean.fromJson(Map<String, dynamic> json) {    
    this.errorCode = json['errorCode'];
    this.errorInfo = json['errorInfo'];
  }


  @override
  String toString() {
    return 'ErrorBean{errorCode: $errorCode, errorInfo: $errorInfo}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorInfo'] = this.errorInfo;
    return data;
  }
}
