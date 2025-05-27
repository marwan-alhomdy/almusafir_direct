import 'package:equatable/equatable.dart';

class Cloudflare extends Equatable {
  final Result? result;
  final bool? success;
  const Cloudflare({
    this.result,
    this.success,
  });

  factory Cloudflare.fromJson(Map<String, dynamic> json) {
    return Cloudflare(
        result: json['result'] != null ? Result.fromJson(json['result']) : null,
        success: json['success']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    data['success'] = success;

    return data;
  }

  @override
  List<Object?> get props => [result, success];
}

class Result extends Equatable {
  final String? id;
  final String? filename;
  final Meta? meta;
  final String? uploaded;
  final bool? requireSignedURLs;
  final List<String>? variants;

  const Result(
      {this.id,
      this.filename,
      this.meta,
      this.uploaded,
      this.requireSignedURLs,
      this.variants});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        id: json['id'],
        filename: json['filename'],
        meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
        uploaded: json['uploaded'],
        requireSignedURLs: json['requireSignedURLs'],
        variants: json['variants'].cast<String>());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    if (meta != null) {
      data['meta'] = meta?.toJson();
    }
    data['uploaded'] = uploaded;
    data['requireSignedURLs'] = requireSignedURLs;
    data['variants'] = variants;
    return data;
  }

  @override
  List<Object?> get props =>
      [id, filename, meta, uploaded, requireSignedURLs, variants];
}

class Meta extends Equatable {
  final String? sdf;
  const Meta({this.sdf});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(sdf: json['sdf']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sdf'] = sdf;
    return data;
  }

  @override
  List<Object?> get props => [sdf];
}
