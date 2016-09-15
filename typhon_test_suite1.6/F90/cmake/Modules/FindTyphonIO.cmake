# FindTyphonIO.cmake -- Find TyphonIO unit test library
# This module will define
#  TyphonIO_FOUND       - Found TyphonIO installation
#  TyphonIO_INCLUDE_DIR - TyphonIO modules directory
#  TyphonIO_LIBRARY     - TyphonIO libraries
#  TyphonIO_MOD_DIR     - TyphonIO module directory
#
# Set the CMake variable TyphonIO_ROOT to tell this module where to find TyphonIO

# TODO: Handle C and Fortran components

find_path(TyphonIO_INCLUDE_DIR typhonio.h
    PATHS
        ${TyphonIO_ROOT}
        $ENV{TyphonIO_ROOT}
        ${TyphonIO_DIR}
    PATH_SUFFIXES include
)

find_library(TyphonIO_C_LIBRARY
    NAMES typhonio
    PATHS
        ${TyphonIO_ROOT}
        $ENV{TyphonIO_ROOT}
        ${TyphonIO_DIR}
    PATH_SUFFIXES lib
)

find_library(TyphonIO_Fortran_LIBRARY
    NAMES typhonio_f
    PATHS
        ${TyphonIO_ROOT}
        $ENV{TyphonIO_ROOT}
        ${TyphonIO_DIR}
    PATH_SUFFIXES lib
)


find_package_handle_standard_args(TyphonIO DEFAULT_MSG
    TyphonIO_INCLUDE_DIR
    TyphonIO_C_LIBRARY
)

mark_as_advanced(TyphonIO_C_LIBRARY TyphonIO_INCLUDE_DIR)

set(TyphonIO_LIBRARIES ${TyphonIO_Fortran_LIBRARY} ${TyphonIO_C_LIBRARY})
set(TyphonIO_INCLUDE_DIRS ${TyphonIO_INCLUDE_DIR})

