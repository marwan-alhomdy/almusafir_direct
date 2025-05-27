class PlaceAutocompletModel {
  String? description;
  List<MatchedSubstring>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Term>? terms;
  List<String>? types;

  PlaceAutocompletModel({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  factory PlaceAutocompletModel.fromJson(Map<String, dynamic> json) =>
      PlaceAutocompletModel(
        description: json['description'] as String?,
        matchedSubstrings: (json['matched_substrings'] as List<dynamic>?)
            ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
            .toList(),
        placeId: json['place_id'] as String?,
        reference: json['reference'] as String?,
        structuredFormatting: json['structured_formatting'] == null
            ? null
            : StructuredFormatting.fromJson(
                json['structured_formatting'] as Map<String, dynamic>),
        terms: (json['terms'] as List<dynamic>?)
            ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
            .toList(),
        types: ((json['types'] as List<dynamic>?) ?? [])
            .map((e) => e.toString())
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'matched_substrings':
            matchedSubstrings?.map((e) => e.toJson()).toList(),
        'place_id': placeId,
        'reference': reference,
        'structured_formatting': structuredFormatting?.toJson(),
        'terms': terms?.map((e) => e.toJson()).toList(),
        'types': types,
      };
}

class MatchedSubstring {
  MatchedSubstring();

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) {
    return MatchedSubstring();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class MainTextMatchedSubstring {
  int? length;
  int? offset;

  MainTextMatchedSubstring({this.length, this.offset});

  factory MainTextMatchedSubstring.fromJson(Map<String, dynamic> json) {
    return MainTextMatchedSubstring(
      length: json['length'] as int?,
      offset: json['offset'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'length': length,
        'offset': offset,
      };
}

class StructuredFormatting {
  String? mainText;
  List<MainTextMatchedSubstring>? mainTextMatchedSubstrings;
  String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      mainTextMatchedSubstrings:
          (json['main_text_matched_substrings'] as List<dynamic>?)
              ?.map((e) =>
                  MainTextMatchedSubstring.fromJson(e as Map<String, dynamic>))
              .toList(),
      secondaryText: json['secondary_text'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'main_text': mainText,
        'main_text_matched_substrings':
            mainTextMatchedSubstrings?.map((e) => e.toJson()).toList(),
        'secondary_text': secondaryText,
      };
}

class Term {
  int? offset;
  String? value;

  Term({this.offset, this.value});

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        offset: json['offset'] as int?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'value': value,
      };
}
