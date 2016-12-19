if(USE_ALLSCALECC)
	set(CMAKE_C_COMPILER ${ALLSCALECC})
	set(CMAKE_CXX_COMPILER ${ALLSCALECC})
endif()

glob_sources(%MODULE%_srcs src)
add_library(%MODULE% ${%MODULE%_srcs})
target_include_directories(%MODULE% PUBLIC include)

add_dependencies(%MODULE% allscale)
target_include_directories(%MODULE% PUBLIC ${ALLSCALE_API_INCLUDE_PATH})

msvc_header_completion(%MODULE%_headers include)

glob_executables(%MODULE%_exes src)
foreach(exe ${%MODULE%_exes})
	get_filename_component(exe_name ${exe} NAME_WE)
	add_executable(%MODULE%_${exe_name} ${exe})
	target_link_libraries(%MODULE%_${exe_name} %MODULE%)
endforeach(exe)

glob_tests(%MODULE%_tests test)
foreach(test ${%MODULE%_tests})
	add_unittest(%MODULE% ${test})
endforeach(test)
