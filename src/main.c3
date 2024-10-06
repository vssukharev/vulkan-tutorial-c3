
module tutorial;

import vulkan, glfw;
import tutorial::cfg, tutorial::helpers;
import std::io;

// ____________________________________________
// ----------------- Types --------------------

struct Data 
{
  Vulkan vulkan;
  Meta meta; 
}

struct Vulkan
{
  VkInstance instance;
}

struct Meta
{
  ZString binary_path;
}

// --------------------------------------------

// ____________________________________________
// --------------- Functions ------------------

/**
 * @param [&out] data
 */
fn void initData(Data* data)
{
  initMeta(&data.meta);
}

/**
 * @param [&out] meta 
 */
fn void initMeta(Meta* meta)
{
  meta.binary_path = helpers::getBinaryPath();
  
  $if(!$feature(NDEBUG)):
    io::printfn("Detected binary path = %s", meta.binary_path);
  $endif
}

// --------------------------------------------



// ____________________________________________
// ------------- Starting Point ---------------

fn int main(String[] args)
{
  Data data @noinit;
  initData(&data);
	return 0;
}

// --------------------------------------------

