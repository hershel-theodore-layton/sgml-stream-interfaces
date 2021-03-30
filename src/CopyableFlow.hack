/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * @inherit
 *
 * This type is considered to be internal to Streamable, however this is not
 * enforced. Implementers of Streamable should consider the implications of
 * exposing this type to subclasses or external entities.
 */
interface CopyableFlow extends WritableFlow {
  /**
   * Must return a new instance which has the same variables and constants.
   * Calls to assignVariable and declareConstant on the current instance made
   * after the copy has been made should not reflect in the copy. Calls to
   * assignVariable and declareConstant on the copy must not be reflected in
   * the current instance. Implementations may decide to disallow modification
   * of the original instance after a copy has been made.
   */
  public function makeCopyForChild(): this;
}
