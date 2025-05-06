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
local c: html.Ctx

c:div(nilptr, {{"class", "red"}}, function(data: pointer)
  for i = 1, 2 do
    c:h1(nilptr, {}, "hello" .. i)
  end
end)
print(c:render())
-- <div class="red"><h1>hello1</h1><h1>hello2</h1></div>
```

## API

### Functions

#### html.escape(s: string): string
Used to escape a string to be appended to the buffer

#### html.raw(s: string): string
Used to format a string to be appended to the buffer without escpaing

#### html.Ctx:el(name: string, data: pointer, attrs: sequence(html.Attr), body: overload(string, function(pointer), niltype)): void
Function to append an html tag to the buffer
- `data`:This is passed as the argument to body when it is a function
- `attrs`: An array of [html.Attr](#htmlattr) that will be converted
- `body`: Either a function or string, if a string, it is escaped and added to the buffer else if a function, it is just run

#### html.Ctx:xxx(data: pointer, attrs: sequence(html.Attr), body: overload(string, function(pointer), niltype)): void
Functions for different html elements
parameters behave the same as [Ctx:el](#htmlctxelname-string-data-pointer-attrs-sequencehtmlattr-body-overloadstring-functionpointer-niltype-void)

#### html.Ctx:text(s: string): void
Appends a string to the buffer and escapes it

#### html.Ctx:raw(s: string): void
Appends a string to the the buffer without escaping it

#### html.Ctx:render(): string
Returns the output of the buffer as a string and destroys the structure

#### html.Ctx:destroy()
Destroys the internal buffer

### Types

#### html

```lua
local html = @record{}
```

#### html.Attr

```lua
local html.Attr = @record{
  name: string,
  value: string
}
```

#### html.Ctx
```lua
local html.Ctx = @record{
  buf: stringbuilder,
}
```

