namespace HTL\SGMLStreamInterfaces;

/**
 * Used by a Renderer to stream content to the consumer.
 *
 * It is not allowed to stream multiple documents to the same Consumer
 * simultaneously. Implementations are not required to behave correctly when
 * multiple documents are streamed simultaneously. Implementations should
 * support streaming multiple documents in series. If they choose to not support
 * this use, they must document as such.
 *
 * All these methods: consumeAsync, flushAsync, receiveWaitNotificationAsync,
 * theDocumentIsCompleteAsync, must not be called concurrently with any method
 * from this list. The Awaitable returned by the method must resolve before the
 * next call is can be made. Implementations are therefore not required to
 * behave correctly when any of these methods are called concurrently.
 */
interface Consumer {
  /**
   * Is called with the next bytes of content.
   */
  public function consumeAsync(string $bytes): Awaitable<void>;
  /**
   * Is called when the author of XHP document explicitly requested a flush to
   * happen at this point in the stream. This is merely a suggestion which may
   * be ignored.
   */
  public function flushAsync(): Awaitable<void>;
  /**
   * Is called when the next Snippet is not yet ready and is being awaited.
   * Suggestion: This might be a good time to flush buffers to the network.
   */
  public function receiveWaitNotificationAsync(): Awaitable<void>;
  /**
   * Is called when the current document is complete and all content has been
   * passed to consumeAsync. This method is only called once per document.
   * Implementations which document that they may only consume a single document
   * are not required to behave correctly after this method is called.
   */
  public function theDocumentIsCompleteAsync(): Awaitable<void>;
}
