add_library(hellovkjni SHARED
        hellovk.cpp
        model_loader.cpp
)

target_include_directories(hellovkjni PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(hellovkjni Vulkan::Vulkan assimp android log)
