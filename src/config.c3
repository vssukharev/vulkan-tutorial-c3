
module std::core::env;

const bool GLFW_INCLUDE_VULKAN = true;


module vulkan;
import vulkan::vk;

const VK_VERSION = vk::VK_API_VERSION_1_0;


module tutorial::cfg;

const int DEF_WIN_WIDTH = 800;
const int DEF_WIN_HEIGHT = 600;


