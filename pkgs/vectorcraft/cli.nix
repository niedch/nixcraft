{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "vectorcraft-cli";
  version = "0.16.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-ih8iRY0rAJQO/RpWneziWEj60Yx1pad9XoxLcZKpIxk=";
    aarch64-linux = "sha256-vVqN1wlO7pXKZxE8vC/a+5T02gCB4a+ymgx7XqeI4BQ=";
  };

  meta.description = "VectorCraft CLI and MCP server";
}
