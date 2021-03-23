namespace HTL\SGMLStreamInterfaces;

use type XHPChild;

/**
 * A marker interface which identifies that this object does not convey
 * information other than its children. When a FragElement is used as a child
 * of an Element, the Element may treat it as a vec of its children. A
 * FragElement must not have attributes. If a FragElement has attributes, they
 * must be ignored.
 */
interface FragElement {
  /**
   * Returns the direct children of an Element. If an element has no children,
   * an empty vec must be returned.
   */
  public function getFragChildren(): vec<XHPChild>;
}
