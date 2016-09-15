
cmake_minimum_required(VERSION 3.0)

project(tio_test_suite)

enable_language(Fortran)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/Modules")

find_package(HDF5 REQUIRED)
find_package(ZLIB REQUIRED)

find_package(pFUnit REQUIRED)

find_package(TyphonIO REQUIRED)

find_package(MPI REQUIRED)

# Generate TyphonIO files for tests
add_subdirectory(tio_file_gen)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_access_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_access_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_access_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_access_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_chunk_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_chunk_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_chunk_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_chunk_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_error_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_error_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_error_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_error_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_global_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_global_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_global_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_global_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_material_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_material_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_material_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_material_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_mesh_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_mesh_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_mesh_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_mesh_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_quant_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_quant_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_quant_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_quant_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_state_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_state_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_state_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_state_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_utils_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_utils_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_utils_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_utils_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_vargroup_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_vargroup_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_vargroup_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_vargroup_test.pf
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tiof_variable_test.F90
    COMMAND ${pFUnit_PARSER} ${CMAKE_CURRENT_SOURCE_DIR}/tiof_variable_test.pf ${CMAKE_CURRENT_BINARY_DIR}/tiof_variable_test.F90
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/tiof_variable_test.pf
)

include_directories(
    ${MPI_Fortran_INCLUDE_PATH}
    #${pFUnit_INCLUDE_DIR}
    ${PROJECT_SOURCE_DIR}
    ${pFUnit_MOD_DIR}
    ${TyphonIO_INCLUDE_DIR}
    #${CMAKE_CURRENT_BINARY_DIR}
)

add_executable(test_runner
    ${pFUnit_INCLUDE_DIR}/driver.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_access_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_chunk_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_error_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_global_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_material_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_mesh_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_quant_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_state_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_utils_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_vargroup_test.F90
    ${CMAKE_CURRENT_BINARY_DIR}/tiof_variable_test.F90
)

target_link_libraries(test_runner
    ${MPI_Fortran_LIBRARIES}
    ${pFUnit_LIBRARY}
    ${TyphonIO_LIBRARIES}
    ${HDF5_LIBRARIES}
)

add_definitions(-DUSE_MPI)

set_target_properties(test_runner PROPERTIES COMPILE_FLAGS "-DUSE_MPI")
#set_target_properties(test_runner PROPERTIES COMPILE_FLAGS "-DPFUNIT_EXTRA_USAGE")
#set_target_properties(test_runner PROPERTIES COMPILE_FLAGS "-DBUILD_ROBUST")
#set_target_properties(test_runner PROPERTIES COMPILE_FLAGS "-DPFUNIT_EXTRA_INITIALIZE")
#set_target_properties(test_runner PROPERTIES COMPILE_FLAGS "-DPFUNIT_EXTRA_FINALIZE")

set_target_properties(test_runner PROPERTIES COMPILE_FLAGS "${MPI_Fortran_COMPILE_FLAGS}")
set_target_properties(test_runner PROPERTIES LINK_FLAGS "${MPI_Fortran_LINK_FLAGS}")


#enable_testing()

#add_test(all_pfunit_tests test_runner)
