import 'package:json_annotation/json_annotation.dart';

part 'container_response_model.g.dart';

/// The model of each BE response.
class ContainerResponseModel<T> {
  /// An object with information about the response.
  final InfoModel info;
  /// The page results.
  final List<T> results;

  const ContainerResponseModel({
    required this.info,
    required this.results,
  });
}

/// The model of the object with information about the response.
@JsonSerializable(explicitToJson: true)
class InfoModel {
  /// The length of the response.
  final int count;
  /// The amount of pages.
  final int pages;
  /// Link to the next page (if it exists).
  final String? next;
  /// Link to the previous page (if it exists).
  final String? prev;

  const InfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
