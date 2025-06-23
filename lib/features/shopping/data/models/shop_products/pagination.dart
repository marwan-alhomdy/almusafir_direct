import 'links.dart';

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json['total'] as int?,
        count: json['count'] as int?,
        perPage: json['per_page'] as int?,
        currentPage: json['current_page'] as int?,
        totalPages: json['total_pages'] as int?,
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'count': count,
        'per_page': perPage,
        'current_page': currentPage,
        'total_pages': totalPages,
        'links': links?.toJson(),
      };
}
