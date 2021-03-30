/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * @see ToHTMLStringAsync->toHTMLStringAsync()
 * @see Streamable->placeIntoSnippetStream()
 */
interface UseAfterRenderException {
  require extends \Exception;
}
