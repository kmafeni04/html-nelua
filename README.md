# html.nelua

A html DSL written for nelua

## How to install

Copy the `html.nelua` file into your project and require it

```lua
local html = require("path.to.html")
```

## Quick start

```lua
local html = require("path.to.html")

local ctx: html.Ctx

local attrs: hashmap(string, string)
attrs["class"] = "red"
ctx:div(attrs, function(self: *html.Ctx, data: pointer)
  for i = 1, 2 do
    self:h1(nil, "hello" .. i)
  end
end)
print(ctx:tostring())
-- <div class="red"><h1>hello1</h1><h1>hello2</h1></div>
```

## Reference

### html module

```lua
local html = @record{}
```

### html.escape

Used to escape a string that will be appended to the [Ctx](#htmlctx) buffer

```lua
function html.escape(s: string): string
```

### html.raw

Used to format a string so that when appended to the [Ctx](#htmlctx) buffer, it will not be escaped

```lua
function html.raw(s: string): string
```

### html.Ctx

This record provides the functions for generating the html

```lua
local html.Ctx = @record{
  buf: stringbuilder,
}
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
local self_closing = inline_map!(string, boolean, {
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

### html.Ctx:el

Function to append a html tag to the [Ctx](#htmlctx) buffer
- `name`: The name of the element tag
- `attrs`: A hashmap that will be formatted as tag attributes
- `body`: Either a function or string, if it is a string, it is escaped and added to the buffer else it is ran
- `data`: This is passed as the `data` argument to `body` when it is a function

```lua
function html.Ctx:el(
  name: string,
  attrs: facultative(hashmap(string, string)),
  body: overload(string, function(self: *html.Ctx, data: pointer), niltype),
  data: pointer
): *html.Ctx
```

### html.Ctx:#|tag|#

Functions for different html elements based on the supported [tags](#supported-tags)
Built off of [Ctx:el](#htmlctxel)

```lua
function html.Ctx:#|tag|#(
  attrs: facultative(hashmap(string, string)),
  body: overload(string, function(self: *html.Ctx, data: pointer), niltype),
  data: pointer
): *html.Ctx
```

### html.Ctx:text

Escapes `s` and appends it to the [Ctx](#htmlctx) buffer

```lua
function html.Ctx:text(s: string): void
```

### html.Ctx:raw

Appends `s` as is to the [Ctx](#htmlctx) buffer

```lua
function html.Ctx:raw(s: string): void
```

### html.Ctx:tostring

Returns the content of the [Ctx](#htmlctx) buffer and clears it

```lua
function html.Ctx:tostring(): string
```

### html.Ctx:tostring

Destroys the [Ctx](#htmlctx) buffer

```lua
function html.Ctx:destroy()
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
