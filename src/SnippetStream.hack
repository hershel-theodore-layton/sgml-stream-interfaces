/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * An object passed down an XHP tree to collect Snippets. addSafeSGML and
 * addSnippet add literal content and Snippet content respectively. This content
 * must be returned from collect in the order in which the calls occurred.
 * Implementations may decide to not be reusable after collect is called. In
 * which case, they must declare as such.
 */
interface SnippetStream {
  /**
   * $safe_sgml is the next literal content. This content must be returned,
   * without escaping, from collect. Implementations will need to wrap the
   * string in a Snippet in order to be able to do so. Non-reusable
   * implementations may throw an exception if this method is called after
   * collect.
   */
  public function addSafeSGML(string $safe_sgml): void;
  /**
   * $snippet is the next Snippet content. Implementations may decide to wrap
   * this Snippet in another Snippet, so this exact Snippet may not appear
   * in the Snippets returned from collect. Non-reusable implementations may
   * throw an exception if this method is called after collect.
   */
  public function addSnippet(Snippet $snippet): void;
  /**
   * Must return content in the order it was passed to addSafeSGML and
   * addSnippet. Reusable implementations must reset their content after this
   * call completes. Non-reusable implementations may reset their content.
   * Non-reusable implementations may throw on any call to collect after the
   * first call.
   */
  public function collect(): vec<Snippet>;
  /**
   * Transforms a Streamable into a SnippetStream. The returned SnippetStream
   * must be a different instance than the current instance. The Streamable must
   * be inserted into the new SnippetStream using the method
   * Streamable->placeIntoSnippetStream().
   */
  public function streamOf(Streamable $streamable): this;
}
