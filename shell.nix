{ pkgs ? import <nixpkgs> {} }: with pkgs;
mkShell {
  buildInputs = [
    c3c
    vulkan-tools-lunarg
    vulkan-validation-layers
    vulkan-tools
    vulkan-loader
    glfw
  ];

  nativeBuildInputs = [
    pkg-config
  ];

  shellHook = ''zsh'';

  VK_LAYER_PATH = "${vulkan-validation-layers}/share/vulkan/explicit_layer.d:${vulkan-tools-lunarg}/share/vulkan/explicit_layer.d"; 
  VK_DRIVER_FILES = /run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json;
  LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${vulkan-tools-lunarg}/lib";
}


