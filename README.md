# html.nelua

A html DSL written for nelua

## How to install

Copy the `html.nelua` file into your project and require it

```lua
local h = require("path.to.html")
```

## Quick guide
Here is a snippet of how this library works
```lua
local h = require("path.to.html")
local e = h.div(
  {
    h.attr("class", "red")
  },
  {
    h.p(
      {},
      {
        h.text("Hello"),
        h.text("World")
      }
    ),
    h.div(
      {},
      {
        (function()
          return html.text("<h1></h1>")
        end)(),
        (function()
          return html.raw("<h1></h1>")
        end)()
      }
    )
  }
)

print(html.render(e))
--[[
will print
<div class="red">
  <p>
    Hello
    World
  </p>
  <div>
    &lt;h1&gt;&lt;/h1&gt;
    <h1></h1>
  </div>
</div>
]]
```

## API

### html.xx(attrs, children)
These are a list of html tags, e.g
```lua
  h.p({h.attr("class", "red")})
  h.a({h.attr("href", "/about")})
```

### html.el(name, attrs, children)
Used when a html tag is not provided, e.g
```lua
h.el("p", {h.attr("class", "red")})
h.el("a", {h.attr("href", "/about")})
```

### html.attr(name, ...)

### html.text(s)

### html.raw(s)

### html.escape(s)

### html.render(el, indent)
