class VulkanRenderer {
    external fun initVulkan(surface: Any)
    external fun resize(width: Int, height: Int)
    external fun cleanup()

    companion object {
        init {
            System.loadLibrary("hellovkjni")
        }
    }
}