vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO hydn10/htracer
  REF v0.4.0
  SHA512 b6f711af1081f65d6524405a70c6879cdc8baf71b7ca0e773e63f5b4a20c9dc938d08cb3612cdf2dbc01d85feb0a5d8bf428ab02b7c0ac4a1cebc1811451050c
  HEAD_REF main
)

vcpkg_check_features(
  OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
    ray-app  HTRACER_BUILD_RAY
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/htracer)

if("ray-app" IN_LIST FEATURES)
  vcpkg_copy_tools(TOOL_NAMES ray AUTO_CLEAN)
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/htracer RENAME copyright)