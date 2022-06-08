vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO hydn10/htracer
  REF v0.3.0
  SHA512 5dce41014cc4f0a7f31bee6ef7b937f7d40556d2cfb8d77d45affe15b1fc28f8c3598a97a118b9d676641a592a226a226e3cea5706bc759923a0d75759ecda70
  HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)