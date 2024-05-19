/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

interface CanProcessSuccessorFlow {
  public function processSuccessorFlow(
    Successor<WritableFlow> $flow,
  )[defaults]: void;
}
