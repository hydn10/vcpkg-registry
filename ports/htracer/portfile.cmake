vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO hydn10/htracer
  REF v0.2.0
  SHA512 04e8860a7c949efac2b1d5b9135da41a4621efc065893bf0682e7383e57ffda36f9aae51ca0695093def95802b420a89c948a8d6711e2df2a909b3a68e766167
  HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)