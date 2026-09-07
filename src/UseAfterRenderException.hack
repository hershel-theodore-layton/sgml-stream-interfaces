/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

use type Exception;

/**
 * @see ToSGMLStringAsync->toHTMLStringAsync()
 * @see Streamable->placeIntoSnippetStream()
 */
interface UseAfterRenderException {
  require extends Exception;
}
