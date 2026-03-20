include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(FR761_RX_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(FR761_RX_default_default_XC8_FILE_TYPE_assemble)
add_library(FR761_RX_default_default_XC8_assemble OBJECT ${FR761_RX_default_default_XC8_FILE_TYPE_assemble})
    FR761_RX_default_default_XC8_assemble_rule(FR761_RX_default_default_XC8_assemble)
    list(APPEND FR761_RX_default_library_list "$<TARGET_OBJECTS:FR761_RX_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(FR761_RX_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(FR761_RX_default_default_XC8_assemblePreprocess OBJECT ${FR761_RX_default_default_XC8_FILE_TYPE_assemblePreprocess})
    FR761_RX_default_default_XC8_assemblePreprocess_rule(FR761_RX_default_default_XC8_assemblePreprocess)
    list(APPEND FR761_RX_default_library_list "$<TARGET_OBJECTS:FR761_RX_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(FR761_RX_default_default_XC8_FILE_TYPE_compile)
add_library(FR761_RX_default_default_XC8_compile OBJECT ${FR761_RX_default_default_XC8_FILE_TYPE_compile})
    FR761_RX_default_default_XC8_compile_rule(FR761_RX_default_default_XC8_compile)
    list(APPEND FR761_RX_default_library_list "$<TARGET_OBJECTS:FR761_RX_default_default_XC8_compile>")

endif()


# Main target for this project
add_executable(FR761_RX_default_image_drgY1pXP ${FR761_RX_default_library_list})

set_target_properties(FR761_RX_default_image_drgY1pXP PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${FR761_RX_default_output_dir}")
target_link_libraries(FR761_RX_default_image_drgY1pXP PRIVATE ${FR761_RX_default_default_XC8_FILE_TYPE_link})

# Add the link options from the rule file.
FR761_RX_default_link_rule( FR761_RX_default_image_drgY1pXP)


