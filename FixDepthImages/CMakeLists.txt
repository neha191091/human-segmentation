set (CMAKE_CXX_STANDARD 11)

find_package(Boost COMPONENTS system filesystem REQUIRED)
set(Boost_INCLUDE_DIR /usr/local/include/boost)
set(Boost_LIBRARY_DIR /usr/local/lib)
include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIR})

MESSAGE( STATUS "Boost_INCLUDE_DIR: " ${Boost_INCLUDE_DIR} )
MESSAGE( STATUS "Boost_LIBRARY_DIR: " ${Boost_LIBRARY_DIR} )
MESSAGE( STATUS "Boost_LIBRARIES: " ${Boost_LIBRARIES} )

add_executable(fixDepthImages main.cpp)
target_link_libraries( fixDepthImages ${Boost_LIBRARIES} )


find_package( OpenCV REQUIRED )
target_link_libraries(fixDepthImages ${OpenCV_LIBS})

