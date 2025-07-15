import 'links.dart';

class Pagination {
  num? total;
  num? count;
  num? perPage;
  num? currentPage;
  num? totalPages;
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
        total: json['total'],
        count: json['count'],
        perPage: json['per_page'],
        currentPage: json['current_page'],
        totalPages: json['total_pages'],
        // links: json['links'] == null
        //     ? null
        //     : Links.fromJson(json['links'] as Map<String, dynamic>),
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
