if(NOT TARGET allscale_api)
	include(ExternalProject)

	ExternalProject_Add(
		allscale_api
		GIT_REPOSITORY git@goedis:herbert.jordan/allscale_api.git
		CMAKE_COMMAND ""
		BUILD_COMMAND ""
		INSTALL_COMMAND ""
		TEST_COMMAND ""
		DOWNLOAD_NO_PROGRESS 1
	)
	ExternalProject_Get_Property(allscale_api source_dir)

	set(ALLSCALE_API_INCLUDE_PATH ${source_dir}/code/include)
endif()
