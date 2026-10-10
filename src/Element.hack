/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

use type XHPChild;

/**
 * Represents an SGML node in an SGML tree.
 */
interface Element extends ToSGMLStringAsync, Streamable {
  /**
   * Emitted by HHVM from member selection involving `XHP_class_name` expression.
   * `$xhp->:prop` is emitted as `$xhp->getAttribute('prop')`.
   *
   * Returns the value assigned to an attribute, including explicit null. An
   * explicit null suppresses any default value. If no value has been assigned
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
  public function getChildren()[]: vec<XHPChild>;

  /**
   * Must return all assigned nonnull data- and aria- attributes, plus nonnull
   * defaults for data- and aria- attributes with no value explicitly assigned.
   * Assigned values override defaults; explicit null suppresses the default
   * and omits the key.
   * When spreading, an absent key does not override the destination's value
   * or default. If a data- or aria- attribute has a non-arraykey value, either
   * an exception must be thrown, the value must be cast to an arraykey, or the
   * value must be filtered out.
   */
  public function getDataAndAriaAttributes()[]: dict<string, arraykey>;

  /**
   * Must return all assigned nonnull declared attributes, plus nonnull defaults
   * for declared attributes with no value explicitly assigned. Assigned values
   * override defaults; explicit null suppresses the default and omits the key.
   * When spreading, an absent key does not override the destination's value
   * or default. Declared aria- and data- attributes must be filtered out.
   */
  public function getDeclaredAttributes()[]: dict<string, nonnull>;
}
