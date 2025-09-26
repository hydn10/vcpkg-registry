#vcpkg-registry

A personal vcpkg registry.


##How-to

To add a new version, update the port and then run:

```bash
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose
```


##Links

https://devblogs.microsoft.com/cppblog/registries-bring-your-own-libraries-to-vcpkg/

https://github.com/microsoft/vcpkg/blob/master/docs/maintainers/registries.md
https://github.com/microsoft/vcpkg/blob/master/docs/users/registries.md
