/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * Wrapper class to kick start the rendering process.
 */
interface ReusableRenderer {
  /**
   * @param $stream better be empty before you start.
   */
  public function renderAsync(
    SnippetStream $stream,
    Streamable $streamable,
    Consumer $consumer,
    Descendant<CopyableFlow> $descendant_flow,
    Init<Flow> $init_flow,
    Successor<WritableFlow> $successor_flow,
  ): Awaitable<void>;
}
