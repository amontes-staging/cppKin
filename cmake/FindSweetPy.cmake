find_path(SweetPy_INCLUDE_DIR NAMES CPythonClass.h PATHS ${PROJECT_3RD_LOC}/include/sweetPy)
find_program(SweetPy_LIBRARY_DIR NAMES libsweetPy${CMAKE_DEBUG_POSTFIX}.so PATHS ${PROJECT_3RD_LOC}/lib)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SweetPy REQUIRED_VARS SweetPy_INCLUDE_DIR)

if(SweetPy_FOUND)
    message(STATUS "Found SweetPy include dir - ${Green}${SweetPy_INCLUDE_DIR}${ColourReset}")
    message(STATUS "Found SweetPy library dir - ${Green}${SweetPy_LIBRARY_DIR}${ColourReset}")
else()
    message(WARNING ${Red}"SweetPy not found${ColourReset}")
endif()
