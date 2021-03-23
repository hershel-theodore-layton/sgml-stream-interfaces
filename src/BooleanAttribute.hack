namespace HTL\SGMLStreamInterfaces;

/**
 * Represents SGML boolean attributes. The value SET should be rendered as an
 * attribute with no value nor an equals sign. The value NOT_SET should not
 * be rendered at all.
 *
 * ```
 * $element = <button disabled={SET} />;
 * $element->toHTMLStringAsync(); // <button disabled></button>
 * $element = <button disabled={NOT_SET} />;
 * $element->toHTMLStringAsync(); // <button></button>
 * ```
 */
newtype BooleanAttribute = ?bool;

const BooleanAttribute SET = true;
const BooleanAttribute NOT_SET = null;
