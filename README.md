# vcpkg-registry

A personal [vcpkg](https://vcpkg.io/) registry.


## How-to

To add a new version:

1. Update the files under [ports](./ports).
2. Stage and commit the changes.
3. Run `vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose`.
4. Run `git add ./versions` and then `git commit --amend --no-edit`.
5. Push changes to upstream.


## Links

https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry

(old?) https://devblogs.microsoft.com/cppblog/registries-bring-your-own-libraries-to-vcpkg/

(old?) https://github.com/microsoft/vcpkg/blob/master/docs/maintainers/registries.md

(old?) https://github.com/microsoft/vcpkg/blob/master/docs/users/registries.md