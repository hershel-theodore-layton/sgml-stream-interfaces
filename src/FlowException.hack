/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * Supertype for ValueNotPresentException and RedeclaredConstantException.
 */
interface FlowException {
  require extends \Exception;

  /**
   * Must return the $key passed to the method which threw the exception.
   */
  public function getKey(): string;
}
