/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

use type XHPChild;

/**
 * Represents an SGML node in an SGML tree.
 */
interface Element extends ToSGMLStringAsync {
  /**
   * Emitted by HHVM from member selection involving `XHP_class_name` expression.
   * `$xhp->:prop` is emitted as `$xhp->getAttribute('prop')`.
   *
   * Returns the value assigned to an attribute. If no value has been assigned
   * to an attribute, the default value must be returned. If no default value
   * has been declared, null must be returned. If an attribute has the
   * @required decorator applied, but no value has been assigned, no behavior
   * is specified. If an attribute has the @lateinit decorator applied and no
   * value has been assigned, no behavior is specified.
   */
  <<HHVMSignature('$xhp->:prop')>>
  public function getAttribute(string $attr)[]: mixed;

  /**
   * Returns the direct children of an Element. If an element has no children,
   * an empty vec must be returned.
   */
  protected function getChildren(): vec<XHPChild>;

  /**
   * Must return all assigned data- and aria- attributes and all data- and aria-
   * attributes with a default value. If an attribute has both a default value
   * and an assigned value, the assigned value must be used. If a data- or aria-
   * attribute has a non arraykey value, either an exception must be thrown, the
   * value must be cast to an arraykey, or the value must be filtered out.
   */
  protected function getDataAndAriaAttributes(): dict<string, arraykey>;

  /**
   * Must return all assigned declared attributes and all declared attributes
   * with a default value. If an attribute has both a default value and an
   * assigned value, the assigned value must be used. Declared aria- and data-
   * attributes must be filtered out.
   */
  protected function getDeclaredAttributes(): dict<string, nonnull>;
}
