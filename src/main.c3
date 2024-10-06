
module tutorial;

import std::io;
import vulkan;
import glfw;

const int WIDTH = 800;
const int HEIGHT = 600;

fn int main(String[] args)
{
  glfw::init();
  defer glfw::terminate();

  glfw::Window* window = glfw::createWindow(WIDTH, HEIGHT, "Hello, C3!", null, null);
  defer glfw::destroyWindow(window);
  
  if (window == null) {
    io::printn("Failed to create GLFW window");
    return 1;
  }

  glfw::makeContextCurrent(window);

  while (!glfw::windowShouldClose(window)) {
    glfw::swapBuffers(window);
    glfw::pollEvents();
  }

	return 0;
}
