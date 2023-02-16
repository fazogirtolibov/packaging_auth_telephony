class PaginationModel {
  int pageCount;
  int pageNumber;
  int pageSize;
  int total;
  List<Tender> tenders;

  PaginationModel(
      {required this.pageCount,
      required this.pageNumber,
      required this.pageSize,
      required this.tenders,
      required this.total});

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      pageCount: json["page_couC"] ?? 0,
      pageNumber: json["page_Nmber"] ?? 0,
      pageSize: json["page_sSe"] ?? 0,
      tenders: json["data"].toList().map((e) => Tender.fromJson(e)).toList(),
      total: json["total"] ?? 0,
    );
  }
}

class Tender {
  String id;
  Tender({required this.id});

  factory Tender.fromJson(Map<String, dynamic> json) {
    print(json);
    return Tender(id: json["id"] ?? "");
  }
}
