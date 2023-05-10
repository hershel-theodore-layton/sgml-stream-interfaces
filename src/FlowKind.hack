/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * A Flow that doesn't have a kind yet. You can pass this Flow anywhere.
 * If you are writing a Flow class, @see `cast_to_chameleon__DO_NOT_USE()`.
 */
type Chameleon<+T as Flow> = Descendant<Init<Successor<T>>>;

/**
 * This flow kind is intended for Flow objects that get passed from parent to
 * child. This is the "classic Flow" that was around the earliest.
 *
 * ```
 * <T1 data-flows-to="2,3,4,5,6">
 *   <T2 data-flows-to="3,4">
 *     <T3 data-flows-to="null"/>
 *     <T4 data-flows-to="null"/>
 *   </T2>
 *   <T5 data-flows-to="6">
 *     <T6 data-flows-to="null"/>
 *   </T5>
 * </T1>
 * ```
 */
newtype Descendant<+T as Flow> as T = T;

/**
 * This flow kind is intended for the Flow object that is forwarded during the
 * `->placeIntoSnippetStream(SnippetStream $stream)` phase of rendering. It is
 * effectively immutable from within the tree.
 */
newtype Init<+T as Flow> as T = T;

/**
 * This flow kind is intended for the Flow object that is passed to each
 * Snippet in document order.
 *
 * ```
 * <T1 data-flows-to="2,3,4,5,6">
 *   <T2 data-flows-to="3,4,5,6">
 *     <T3 data-flows-to="4,5,6"/>
 *     <T4 data-flows-to="5,6"/>
 *   </T2>
 *   <T5 data-flows-to="6">
 *     <T6 data-flows-to="null"/>
 *   </T5>
 * </T1>
 * ```
 */
newtype Successor<+T as Flow> as T = T;

/**
 * There must be some way to convert a newly constructed Flow (without a kind)
 * to one with a kind. Newtype is limited to the file in which it is declared.
 * Application developers should not have a reason to use this function.
 * Flow implementations should contain a static method which constructs
 * instances of the type `Chameleon<this>`. This allows application developers
 * to use your Flow for any purpose.
 *
 * ```
 * use function HTL\SGMLStreamInterfaces\cast_to_chameleon__DO_NOT_USE;
 *
 * final class LibraryFlow implements CopyableFlow {
 *   private function __construct(private dict<string, mixed> $values) { ... }
 *
 *   public static function createEmpty(): SGMLStreamInterfaces\Chameleon<this> {
 *     return cast_to_chameleon__DO_NOT_USE(new static(dict[]));
 *   }
 *   // The rest of the class
 * }
 * ```
 */
function cast_to_chameleon__DO_NOT_USE<T as Flow>(T $t): Chameleon<T> {
  return $t;
}
