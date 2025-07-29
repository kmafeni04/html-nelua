---@class PackageDependency
---@field name string package name as it will be used in file gen
---@field repo string git repo
---@field version? string git hash(#) or tag(v), defaults to "#HEAD"

---@class Package
---@field dependencies? PackageDependency[] List of package dependencies
---@field scripts? table<string, string> scripts that can be called with `nlpm script`

---@type Package
return {
  dependencies = {
    {
      name = "ssdg",
      repo = "https://github.com/kmafeni04/ssdg",
      version = "#a41a8ff83b1baea1b3ef53bf27ce1c8966f62ec4",
    },
  },
  scripts = {
    docs = "nelua html-doc.nelua",
    test = "nelua test.nelua",
  },
}
