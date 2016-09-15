
include_directories(
    ${TyphonIO_INCLUDE_DIR}
)

set_source_files_properties(
    access.F90
    chunks.F90
    material.F90
    mesh.F90
    quant.F90
    state.F90
    utils.F90
    vargroup.F90
    variable.F90    
    PROPERTIES COMPILE_FLAGS -ffree-line-length-none)

add_executable(access.x access.F90)
add_executable(chunks.x chunks.F90)
add_executable(material.x material.F90)
add_executable(mesh.x mesh.F90)
add_executable(quant.x quant.F90)
add_executable(state.x state.F90)
add_executable(utils.x utils.F90)
add_executable(vargroup.x vargroup.F90)
add_executable(variable.x variable.F90)

target_link_libraries(access.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(chunks.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(material.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(mesh.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(quant.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(state.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(utils.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(vargroup.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})
target_link_libraries(variable.x ${TyphonIO_LIBRARIES} ${HDF5_LIBRARIES})