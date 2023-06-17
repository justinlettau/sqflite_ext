/// Convert a boolean to an int.
int boolToInt(bool value) {
  return value ? 1 : 0;
}

/// Convert a boolean to an int, or null.
int? boolToIntOrNull(bool? value) {
  if (value == null) {
    return null;
  }

  return boolToInt(value);
}

/// Convert an int to a boolean.
bool intToBool(int value) {
  return value == 1 ? true : false;
}

/// Convert an int to a boolean, or null.
bool? intToBoolOrNull(int? value) {
  if (value == null) {
    return null;
  }

  return intToBool(value);
}
