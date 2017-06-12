if(NOT TARGET allscale)
	include(ExternalProject)

	if(USE_ALLSCALECC)
		if(NOT EXISTS ${THIRD_PARTY_DIR})
			message(STATUS
				"=================================================================\n"
				"No third_party directory found, will set it up for you in 5 seconds:\n"
				"====================================================================\n"
			)
			execute_process(COMMAND ${CMAKE_COMMAND} -E sleep 5)
			execute_process(
				COMMAND bash ${PROJECT_SOURCE_DIR}/../scripts/dependencies/installer
				WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
			)
			execute_process(
				COMMAND bash ${PROJECT_SOURCE_DIR}/../scripts/dependencies/third_party_linker
				WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
			)
		endif()

		ExternalProject_Add(
			allscale
			GIT_REPOSITORY https://github.com/allscale/allscale_compiler
			GIT_TAG a48dc1ff7ee08d92f059c8352c05c1b3b94eb67f
			CMAKE_COMMAND
				${CMAKE_COMMAND} -E env
				"INSIEME_LIBS_HOME=${THIRD_PARTY_DIR}"
				${CMAKE_COMMAND}
			CMAKE_ARGS
				${CMAKE_EXTERNALPROJECT_FORWARDS}
				-DINSIEME_C_BACKEND_COMPILER=${CMAKE_C_COMPILER}
				-DINSIEME_CXX_BACKEND_COMPILER=${CMAKE_CXX_COMPILER}
				-DINVOKED_AS_EXTERNAL_PROJECT=ON
				-DTHIRD_PARTY_DIR=${THIRD_PARTY_DIR}
			BUILD_COMMAND $(MAKE) compiler_allscalecc
			INSTALL_COMMAND ""
			EXCLUDE_FROM_ALL 1
			DOWNLOAD_NO_PROGRESS 1
		)
		ExternalProject_Get_Property(allscale source_dir binary_dir)

		set(ALLSCALECC ${binary_dir}/code/compiler/allscalecc)
		set(ALLSCALE_API_INCLUDE_PATH ${source_dir}/api/code/api/include ${source_dir}/api/code/utils/include)
	else()
		ExternalProject_Add(
			allscale
			GIT_REPOSITORY https://github.com/allscale/allscale_api
			GIT_TAG 9c621571058c5432fac9a81e3f6af95bf8928038
			CONFIGURE_COMMAND ""
			BUILD_COMMAND ""
			INSTALL_COMMAND ""
			EXCLUDE_FROM_ALL 1
			DOWNLOAD_NO_PROGRESS 1
		)
		ExternalProject_Get_Property(allscale source_dir binary_dir)

		set(ALLSCALE_API_INCLUDE_PATH ${source_dir}/code/api/include ${source_dir}/code/utils/include)
	endif()
endif()
