/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * Classes which desire to render in Snippets. Implementations may decide to
 * throw a UseAfterRenderException when it is asked to render itself multiple
 * times.
 */
interface Streamable {
  /**
   * Must insert its content into $stream while the call has not yet returned
   * or thrown. Implementations may not insert content after the method has
   * returned or thrown.
   */
  public function placeIntoSnippetStream(SnippetStream $stream): void;
}
