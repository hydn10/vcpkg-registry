vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO hydn10/htracer
  REF v1.0.0
  SHA512 7f352363c25870c25506442df6b72091714dcc3ca60fcb446bfee07592f7be78c275e1caafa0f27380a52cf394581ff3fdcf605c583e2f1a035fc37776e172e0
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