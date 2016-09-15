# FindpFUnit.cmake -- Find pFUnit unit test library
# This module will define
#  PFUNIT_FOUND       - Found pFUnit installation
#  pFUnit_INCLUDE_DIR - pFUnit modules directory
#  pFUnit_LIBRARY     - pFUnit libraries
#  pFUnit_MOD_DIR     - pFUnit module directory
#
# Set pFUnit_ROOT to tell this module where to find pFUnit

find_path(pFUnit_INCLUDE_DIR driver.F90
    HINTS "${pFUnit_ROOT}/include" "${pFUnit_DIR}/include"
)

find_library(pFUnit_LIBRARY
    NAMES pfunit
    HINTS "${pFUnit_ROOT}/lib" "${pFUnit_DIR}/lib"
)

find_path(pFUnit_MOD_DIR
    NAMES testsuite_mod.mod
    HINTS "${pFUnit_ROOT}/mod" "${pFUnit_DIR}/mod"
)

find_program(pFUnit_PARSER
    NAMES pFUnitParser.py
    HINTS "${pFUnit_ROOT}/bin" "${pFUnit_DIR}/bin"
)


find_package_handle_standard_args(pFUnit DEFAULT_MSG
    pFUnit_INCLUDE_DIR
    pFUnit_LIBRARY
    pFUnit_MOD_DIR
)

