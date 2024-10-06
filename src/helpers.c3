
module tutorial::helpers;

import std::os::linux;

fn ZString getBinaryPath()
{
  const usz START_BUF_SZ = 64;
  isz bytes_read    = -1;
  ZString buf       = null;
  ushort multiplier = 2;
  
  buf = (ZString) malloc(START_BUF_SZ);
  bytes_read = linux::readlink("/proc/self/exe", (char*) buf, START_BUF_SZ);
  
  while (bytes_read < 0) {
    free(buf);
    buf = (ZString) malloc(START_BUF_SZ * multiplier);
    bytes_read = linux::readlink("/proc/self/exe", (char*) buf, START_BUF_SZ * multiplier);
    ++multiplier;
  }

  buf[bytes_read] = 0;

  return buf;
}

