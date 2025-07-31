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
      version = "#9e1fb58f183ae7efea98d25a40d6d1bf38f483af",
    },
    {
      name = "map-nelua",
      repo = "https://github.com/kmafeni04/map-nelua",
      version = "#74f7d0ebbf5057ba202f2659d25c75b225b17d7d",
    },
  },
  scripts = {
    docs = "nelua html-doc.nelua",
    test = "nelua test.nelua",
  },
}
