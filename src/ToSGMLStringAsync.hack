/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

use type XHPChild;

/**
 * Marker interface which allows any class to become a valid XHPChild.
 *
 * This interface is identical to Facebook\XHP\UnsafeRenderable.
 */
interface ToSGMLStringAsync extends XHPChild {
  /**
   * Implementations make the semantic guarantee that the string returned from
   * this method is safe to embed in SGML contexts as a child of a node.
   *
   * ```
   * <html>__HERE__</html>
   * ```
   *
   * Implementations may decide to throw a UseAfterRenderException when it
   * is asked to render itself multiple times.
   *
   * Even though this method mentions HTML instead of SGML, this should be safe
   * in SGML contexts, not just HTML contexts. The name was chosen for easier
   * interop with xhp-lib.
   */
  public function toHTMLStringAsync(): Awaitable<string>;
}
