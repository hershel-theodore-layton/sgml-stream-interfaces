/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * @deprecated Use ReusableRenderer instead.
 *
 * Kick-starts the process of rendering an SGML tree to a Consumer. A Renderer
 * may decide to be non-reusable. In which case, it must document as such.
 */
interface Renderer {
  /**
   * Renders an SGML tree to $consumer with $flow. This tree is obtained via
   * different unspecified means F.e. the constructor or a setter.
   */
  public function renderAsync(
    Consumer $consumer,
    CopyableFlow $flow,
  )[defaults]: Awaitable<void>;
}
