if(NOT TARGET allscale)
	include(ExternalProject)

	if(USE_ALLSCALECC)
		ExternalProject_Add(
			allscale
			GIT_REPOSITORY git@goedis.dps.uibk.ac.at:philipp.gschwandtner/allscale-compiler.git
			CMAKE_COMMAND
				${CMAKE_COMMAND} -E env
				"INSIEME_LIBS_HOME=${PROJECT_SOURCE_DIR}/third_party"
				${CMAKE_COMMAND}
				-DINSIEME_C_BACKEND_COMPILER=${CMAKE_C_COMPILER}
				-DINSIEME_CXX_BACKEND_COMPILER=${CMAKE_CXX_COMPILER}
			BUILD_COMMAND $(MAKE) allscalecc
			INSTALL_COMMAND ""
			TEST_COMMAND ""
			EXCLUDE_FROM_ALL 1
			DOWNLOAD_NO_PROGRESS 1
		)
		ExternalProject_Get_Property(allscale source_dir binary_dir)

		set(ALLSCALECC ${binary_dir}/code/allscalecc)
		set(ALLSCALE_API_INCLUDE_PATH ${source_dir}/api/code/include)
	else()
		ExternalProject_Add(
			allscale
			GIT_REPOSITORY git@goedis.dps.uibk.ac.at:herbert.jordan/allscale_api.git
			BUILD_COMMAND ""
			INSTALL_COMMAND ""
			TEST_COMMAND ""
			EXCLUDE_FROM_ALL 1
			DOWNLOAD_NO_PROGRESS 1
		)
		ExternalProject_Get_Property(allscale source_dir binary_dir)

		set(ALLSCALE_API_INCLUDE_PATH ${source_dir}/code/include)
	endif()
endif()
