if(NOT TARGET allscale_compiler)
	include(ExternalProject)

	ExternalProject_Add(
		allscale_compiler
		GIT_REPOSITORY git@goedis:philipp.gschwandtner/allscale-compiler.git
		UPDATE_COMMAND ""
		CMAKE_COMMAND
			${CMAKE_COMMAND} -E env
			"INSIEME_LIBS_HOME=${PROJECT_SOURCE_DIR}/third_party"
			${CMAKE_COMMAND}
		INSTALL_COMMAND ""
		TEST_COMMAND ""
		DOWNLOAD_NO_PROGRESS 1
	)
	ExternalProject_Get_Property(allscale_compiler binary_dir)

	set(ALLSCALECC ${binary_dir}/code/allscalecc)
endif()

