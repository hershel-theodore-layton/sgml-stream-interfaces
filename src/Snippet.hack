/** sgml-stream-interfaces is MIT licensed, see /LICENSE. */
namespace HTL\SGMLStreamInterfaces;

/**
 * A small piece of possibly asynchronously generated SGML content.
 */
interface Snippet {
  /**
   * Is called during rendering and indicates that you should start your work
   * needed for feedBytesToConsumerAsync. The Awaitable returned by this method
   * may not have resolved before feedBytesToConsumerAsync is called. This
   * method may not be invoked more than once. Implementations are not required
   * to behave correctly when this method is called more than once.
   */
  public function primeAsync(CopyableFlow $flow): Awaitable<void>;
  /**
   * Is called when it is your turn to stream bytes to the consumer.
   * Implementations may not call methods on $consumer after the returned
   * Awaitable resolves. This method may not be called before primeAsync is
   * called. Implementations are not required to behave correctly if this
   * method is called before primeAsync is called. Implementations may guard
   * against the invalid call order of primeAsync and feedBytesToConsumerAsync,
   * but they are not required to do so. If an invalid call order is detected,
   * we suggest throwing a SnippetNotPrimedException. This method may not be
   * called more than once. Implementations are not required to behave correctly
   * when this method is called more than once. If an implementation needs to
   * await an Awaitable that is not yet ready (Asio\has_finished()), they may
   * call receiveWaitNotificationAsync concurrently with awaiting this
   * Awaitable. You may not call any other methods on $consumer before the
   * Awaitable returned by receiveWaitNotificationAsync resolves.
   */
  public function feedBytesToConsumerAsync(Consumer $consumer): Awaitable<void>;
}
