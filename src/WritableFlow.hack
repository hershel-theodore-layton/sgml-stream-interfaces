/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * @inherit
 */
interface WritableFlow extends Flow {
  /**
   * Any call to get or getx with $key after this call returns, must return
   * $value. If another is made with the same $key, the new $value must be
   * stored and returned from future calls to get and getx. If declareConstant
   * was called with $key before, a RedeclaredConstantException must be thrown
   * and $value must be ignored. Implementations may throw an exception if the
   * format of $key is not valid to their own specification.
   */
  public function assignVariable(string $key, mixed $value): void;
  /**
   * Identical to assignVariable, which the exception of the case of multiple
   * calls with the same $key. If assignVariable or declareConstant have been
   * called with $key before, a RedeclaredConstantException and $value must be
   * ignored. Implementations may throw an exception if the format of $key is
   * not valid to their own specification.
   */
  public function declareConstant(string $key, mixed $value): void;
}
