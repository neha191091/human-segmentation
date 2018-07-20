find_package(Boost 1.62.0 REQUIRED COMPONENTS system filesystem)
include_directories(${Boost_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIRS})

find_package( OpenCV REQUIRED )
add_executable(example example.cpp)
# link the static Tensorflow library
#target_link_libraries(example TensorflowCC::Static)
# link the shared Tensorflow library
target_link_libraries(example ${OpenCV_LIBS} ${Boost_LIBRARIES})
