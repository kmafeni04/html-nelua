# html.nelua

A html DSL written for nelua

## How to install

Add to your [nlpm](https://github.com/kmafeni04/nlpm) package dependencies
```lua
{
  name = "html-nelua",
  repo = "https://github.com/kmafeni04/html-nelua",
  version = "COMMIT-HASH-OR-TAG",
},
```

```lua
local html = require("path.to.html")
```

## Quick start

```lua
local html = require("path.to.html")

local attrs: hashmap(string, string)
attrs["class"] = "red"
local el = html.div(attrs, (do
  local els: sequence(html.Element)
  for i = 1, 2 do
    els:push(html.h1(nil, "hello" .. i))
  end
  in els
end))
print(el:tostring())
-- <div class="red"><h1>hello1</h1><h1>hello2</h1></div>
```

## Reference

### html module

```lua
local html = @record{}
```

### html.Element

```lua
local html.Element = @record{
  buf: stringbuilder
}
```

### html.Element:tostring

Returns the content of the [Element's](#htmlelement) buffer and clears it

```lua
function html.Element:tostring(): string
```

### html.Element:destroy

Destroys the [Element's](#htmlelement) buffer

```lua
function html.Element:destroy()
```

### Supported tags

```lua
local tags = {
  "a",  "abbr",  "address",  "area",  "article",
  "aside",  "audio",  "b",  "base",  "bdi",
  "bdo",  "blockquote",  "body",  "br",  "button",
  "canvas",  "caption",  "cite",  "code",  "col",
  "colgroup",  "data",  "datalist",  "dd",  "del",
  "details",  "dfn",  "dialog",  "div",  "dl",
  "dt",  "em",  "embed",  "fieldset",  "figcaption",
  "figure",  "footer",  "form",  "h1",  "h2",
  "h3",  "h4",  "h5",  "h6",  "head",
  "header",  "hr",  "html",  "i",  "iframe",
  "img",  "input",  "ins",  "kbd",  "label",
  "legend",  "li",  "link",  "main",  "map",
  "mark",  "meta",  "meter",  "nav",  "noscript",
  "object",  "ol",  "optgroup",  "option",  "output",
  "p",  "picture",  "pre",  "progress",  "q",
  "rp",  "rt",  "ruby",  "s",  "samp",
  "script",  "section",  "select",  "small",  "source",
  "span",  "strong",  "style",  "sub",  "summary",
  "sup",  "table",  "tbody",  "td",  "template",
  "textarea",  "tfoot",  "th",  "thead",  "time",
  "title",  "tr",  "track",  "u",  "ul",
  "var",  "video",  "wbr",
}
```

If a tag is marked as self closing, the `body` will be ignored

```lua
local self_closing = map!(string, boolean, {
  area = true,
  br = true,
  col = true,
  embed = true,
  hr = true,
  img = true,
  input = true,
  link = true,
  meta = true,
  param = true,
  source = true,
  track = true,
  wbr = true,
})
```

### html.escape

Used to escape a string that will be appended to an [Element's](#htmlelement) buffer

```lua
function html.escape(s: string): string
```

### html.el

Function to create a new html [Element](#htmlelement)
- `name`: The name of the element tag
- `attrs`: A hashmap that will be formatted as tag attributes
- `body`: Either a function or string, if it is a string, it is escaped and added to the buffer else it is ran

```lua
function html.el(
  name: string,
  attrs: facultative(hashmap(string, string)),
  body: overload(string, html.Element, sequence(html.Element), niltype)
): html.Element
```

### html.#|tag|#

Functions for different html elements based on the supported [tags](#supported-tags)
Built off of [html.el](#htmlel)

```lua
function html.#|tag|#(
  attrs: facultative(hashmap(string, string)),
  body: overload(string, html.Element, sequence(html.Element), niltype)
): html.Element
```

### html.text

Escapes `s` and creates a new [Element](#htmlelement) from it

```lua
function html.text(s: string): html.Element
```

### html.raw

Creates a new [Element](#htmlelement) from `s` as is

```lua
function html.raw(s: string): html.Element
```

## Development

### Running Tests
From the project root:
```console
$ nelua test.nelua
```

### Contributing
1. Fork the repository
2. Create a feature branch
3. Add tests for new features
4. Submit a pull request

For questions or issues, please use the GitHub issue tracker.
