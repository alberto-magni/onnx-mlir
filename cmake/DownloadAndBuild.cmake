# Download and unpack PACKAGE_NAME at configure time using the configure script ${DOWNLOAD_SCRIPT}
function(download_and_build PACKAGE_NAME DOWNLOAD_SCRIPT)
  configure_file(${DOWNLOAD_SCRIPT} ${PACKAGE_NAME}/CMakeLists.txt)
  execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${PACKAGE_NAME})
  if(result)
    message(FATAL_ERROR "CMake step ${PACKAGE_NAME} failed: ${result}")
  endif()
  execute_process(COMMAND ${CMAKE_COMMAND} --build .
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${PACKAGE_NAME})
  if(result)
    message(FATAL_ERROR "Download step for ${PACKAGE_NAME} failed: ${result}")
  endif()
endfunction()
