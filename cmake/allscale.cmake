if(NOT TARGET allscale_compiler)
	include(ExternalProject)

	if(USE_ALLSCALECC)
		set(_build_cmd $(MAKE) allscalecc)
	else()
		set(_build_cmd $(MAKE) allscale_runtime)
	endif()

	ExternalProject_Add(
		allscale_compiler
		GIT_REPOSITORY git@goedis.dps.uibk.ac.at:philipp.gschwandtner/allscale-compiler.git
		CMAKE_COMMAND
			${CMAKE_COMMAND} -E env
			"INSIEME_LIBS_HOME=${PROJECT_SOURCE_DIR}/third_party"
			${CMAKE_COMMAND}
			-DINSIEME_C_BACKEND_COMPILER=${CMAKE_C_COMPILER}
			-DINSIEME_CXX_BACKEND_COMPILER=${CMAKE_CXX_COMPILER}
		BUILD_COMMAND ${_build_cmd}
		INSTALL_COMMAND ""
		TEST_COMMAND ""
		DOWNLOAD_NO_PROGRESS 1
	)
	ExternalProject_Get_Property(allscale_compiler source_dir binary_dir)

	set(ALLSCALECC ${binary_dir}/code/allscalecc)
	set(ALLSCALE_API_INCLUDE_PATH ${source_dir}/api/code/include)
endif()
