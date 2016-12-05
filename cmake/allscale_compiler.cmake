if(NOT TARGET allscale_compiler)
	include(ExternalProject)

	ExternalProject_Add(
		allscale_compiler
		GIT_REPOSITORY git@goedis:philipp.gschwandtner/allscale-compiler.git
		BUILD_COMMAND make allscalecc
		INSTALL_COMMAND ""
		TEST_COMMAND ""
		DOWNLOAD_NO_PROGRESS 1
	)
	ExternalProject_Get_Property(allscale_compiler binary_dir)

	set(ALLSCALECC ${binary_dir}/code/allscalecc)
endif()

