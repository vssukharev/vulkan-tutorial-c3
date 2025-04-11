{ 
  mkShell,
  lib,
  c3c,
  shaderc,
  vulkan-headers,
  vulkan-loader,
  vulkan-tools-lunarg,
  vulkan-helper,
  vulkan-tools,
  mangohud,
  vulkan-validation-layers,
  libGL,
  glfw,
  glfw2,
  glfw-wayland,
  wayland,
  glm,
  pkg-config,
}: 
mkShell {
  buildInputs = [
    c3c

    shaderc

    vulkan-headers
    vulkan-loader
    vulkan-tools-lunarg
    vulkan-helper
    vulkan-tools
    mangohud
    vulkan-validation-layers

    libGL
    glfw
    glfw2
    glfw-wayland

    wayland
    
    glm
  ];


  nativeBuildInputs = [
    pkg-config
  ];

  # If it doesn’t get picked up through nix magic
  VK_LAYER_PATH = builtins.concatStringsSep ":" [ "${vulkan-validation-layers}/share/vulkan/explicit_layer.d" "${vulkan-tools-lunarg}/share/vulkan/explicit_layer.d" ]; 
  VK_DRIVER_FILES = /run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json;
  # VULKAN_SDK = "${pkgs.vulkan-tools-lunarg}";
  LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${vulkan-tools-lunarg}/lib";
}

