v2.0.0
--------------------

#### Breaking Changes
- React >= v0.14.0 is required as of v2.0.0


v1.1.0
--------------------

#### Features
- passing null as value resets any previous declared value and remove the meta tag

#### Bugs
- allow array of strings as value in prop type validation


v1.0.1
--------------------

#### Bugs
- avoid crashing when trying to render without any props mounted


v1.0.0
--------------------

- `react-side-effect` has been updated to v1.0.1, which included breaking changes. Most of these is handled internally, maintaining the same API for `react-document-meta`. See below for breaking changes.


#### Breaking Changes
- `DocumentMeta.rewind()` no longer takes an argument with options, and therefore `.rewind({ asReact: true })` and `.rewind({ asHtml: true })` is no longer possible. Two new static methods has been added to support this feature: `.renderAsReact()` and `.renderAsHTML()`

