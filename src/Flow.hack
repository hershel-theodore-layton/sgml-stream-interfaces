namespace HTL\SGMLStreamInterfaces;

/**
 * An object which serves as a communication channel between a parent Streamable
 * and its children.
 *
 * Implementations must model a variable store and a constant store. Constants
 * may only be declared once. Variables may be assigned many times. Assigning
 * to a variable that does not yet exist, will also declare this variable.
 * Variables and constants have string names (keys). Implementations may choose
 * to restrict what is a considered a valid key for a variable or a constant.
 * Variables and constants can not be unset after having been assigned or
 * declared. Users which want to unset a variable may assign null to it.
 */
interface Flow {
  /**
   * A request for a variable or constant. If the variable or constant is not
   * present, null must be returned. If a constant is present, any subsequent
   * calls must yield the same value. If a variable is present, any subsequent
   * calls must yield a value, but this may not be the same value if the
   * variable was reassigned.
   */
  public function get(string $key): mixed;
  /**
   * Identical to get, with the exception of the case in which a variable or
   * constant is not present. Implementations must throw a
   * ValueNotPresentException when a variable or constant is not present.
   */
  public function getx(string $key): mixed;
  /**
   * Returns true when a variable or constant is present, false otherwise. Once
   * true has been returned for a certain key, all subsequent calls for the same
   * key must always return true. This results from the requirement that
   * constants and variables may not be unset.
   */
  public function has(string $key): bool;
}
