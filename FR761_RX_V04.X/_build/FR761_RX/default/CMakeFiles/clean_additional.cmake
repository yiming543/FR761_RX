# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "D:\\yiming\\04github\\FR761_RX\\FR761_RX_V04.X\\out\\FR761_RX\\default.cmf"
  "D:\\yiming\\04github\\FR761_RX\\FR761_RX_V04.X\\out\\FR761_RX\\default.hex"
  "D:\\yiming\\04github\\FR761_RX\\FR761_RX_V04.X\\out\\FR761_RX\\default.hxl"
  "D:\\yiming\\04github\\FR761_RX\\FR761_RX_V04.X\\out\\FR761_RX\\default.mum"
  "D:\\yiming\\04github\\FR761_RX\\FR761_RX_V04.X\\out\\FR761_RX\\default.o"
  "D:\\yiming\\04github\\FR761_RX\\FR761_RX_V04.X\\out\\FR761_RX\\default.sdb"
  "D:\\yiming\\04github\\FR761_RX\\FR761_RX_V04.X\\out\\FR761_RX\\default.sym"
  )
endif()
