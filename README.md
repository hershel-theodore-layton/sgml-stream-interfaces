# sgml-stream-interfaces

Interfaces for interop with hershel-theodore-layton/sgml-stream

## Element attributes

`Element::getAttribute()` returns the assigned value, including explicit null,
or the default when no value was assigned. The attribute maps expose only
nonnull values: declared attributes go in `getDeclaredAttributes()`, while
`data-` and `aria-` attributes go in `getDataAndAriaAttributes()`. The latter
accepts only arraykey values; implementations may reject, cast, or filter other
nonnull values as specified in the interface.

For an ordinary nullable attribute `a`, the same null and default rules apply
to both maps:

| Input for `a` | Default | `getAttribute('a')` | Entry in the appropriate map |
| --- | --- | --- | --- |
| Omitted | None or null | null | Absent |
| Omitted | `'fallback'` | `'fallback'` | `'a' => 'fallback'` |
| Explicit `'value'` | Any | `'value'` | `'a' => 'value'` |
| Explicit null | `'fallback'` | null | Absent |
| Spread source omits `a`; destination otherwise omits `a` | Destination: `'fallback'` | `'fallback'` | `'a' => 'fallback'` |

Spreading copies only present map entries. In `sgml-stream`, declared entries
are copied only when the destination declares that attribute; data- and aria-
entries do not require a destination declaration. A source whose `a` was explicitly
set to null (even over a nonnull default) cannot clear the destination's value
or default. A source's nonnull default is present in its map and can be copied.
For example, directly assigning `a={null}` suppresses `'fallback'`, whereas
spreading that element into another element defaulted to `'fallback'` preserves
the destination's default. Explicit values and spreads take effect in their
order in the XHP opening tag.

Behavior for unassigned `@required` and `@lateinit` attributes remains
unspecified by the interface.
