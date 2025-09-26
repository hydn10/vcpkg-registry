vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO hydn10/htracer
  REF v1.1.0
  SHA512 cc259e889cdf9a10a818165de06798244640e06abd72033a325753b4a48e711dff4a686afec130f022aa2e5e0586fee420a9ddeb60db61c50ccfa10e6296acdb
  HEAD_REF main
)

vcpkg_check_features(
  OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
    ray-app HTRACER_BUILD_RAY
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    ${FEATURE_OPTIONS}
    -DHTRACER_BUILD_EXAMPLES=OFF
    -DHTRACER_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/htracer)

if("ray-app" IN_LIST FEATURES)
  vcpkg_copy_tools(TOOL_NAMES htracer-ray AUTO_CLEAN)
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/htracer RENAME copyright)