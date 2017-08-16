if(DEFINED ALLSCALECC)
	message("Using ${ALLSCALECC} as compiler")
	set(CMAKE_C_COMPILER ${ALLSCALECC})
	set(CMAKE_CXX_COMPILER ${ALLSCALECC})
endif()

add_module_library(%MODULE%)

add_dependencies(%MODULE% allscale)
target_include_directories(%MODULE% PUBLIC ${ALLSCALE_API_INCLUDE_PATH})

glob_executables(%MODULE%_exes src)
foreach(exe ${%MODULE%_exes})
	add_module_executable(%MODULE% ${exe})
endforeach(exe)

glob_tests(%MODULE%_tests test)
foreach(test ${%MODULE%_tests})
	add_module_unittest(%MODULE% ${test})
endforeach(test)
