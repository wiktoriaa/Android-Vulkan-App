#ifndef HELLOVK_H
#define HELLOVK_H

#include <vulkan/vulkan.h>
#include <android/native_window.h>

class HelloVK {
public:
    HelloVK();
    ~HelloVK();

    void initVulkan(ANativeWindow* window);
    void cleanup();
    void render();
    void resize(int width, int height);

private:
    void createInstance();
    void createDevice();
    void createSwapchain();
    // Dodaj inne metody potrzebne do konfiguracji Vulkan
};

#endif // HELLOVK_H
