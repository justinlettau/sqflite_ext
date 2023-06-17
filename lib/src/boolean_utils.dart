/// Convert a boolean to an int.
int boolToInt(dynamic value) {
  if (value is int) {
    return value;
  }

  return value ? 1 : 0;
}

/// Convert a boolean to an int, or null.
int? boolToIntOrNull(dynamic value) {
  if (value == null) {
    return null;
  }

  return boolToInt(value);
}

/// Convert an int to a boolean.
bool intToBool(dynamic value) {
  if (value is bool) {
    return value;
  }

  return value == 1 ? true : false;
}

/// Convert an int to a boolean, or null.
bool? intToBoolOrNull(dynamic value) {
  if (value == null) {
    return null;
  }

  return intToBool(value);
}
