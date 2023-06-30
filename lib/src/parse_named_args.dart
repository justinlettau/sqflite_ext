/// A parsed raw query + argument values.
class QueryWithArgs {
  QueryWithArgs(this.query, this.arguments);

  /// Query with named arguments replace with placeholders (?).
  String query;

  /// List of query argument values.
  List<Object?> arguments;
}

/// Parse a query with named arguments into a raw query + argument values.
QueryWithArgs parseNamedArgs(String query, Map<String, dynamic> params) {
  final exp = RegExp(r":([\w]+)");
  List<Object?> arguments = [];
  RegExpMatch? match;

  while ((match = exp.firstMatch(query)) != null) {
    final name = query.substring(match!.start + 1, match.end);
    query = query.replaceRange(match.start, match.end, '?');
    arguments.add(params[name]);
  }

  return QueryWithArgs(query, arguments);
}
