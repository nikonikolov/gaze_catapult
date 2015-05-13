
# Loop constraints
directive set /vga_mouse_square/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /vga_mouse_square/core/main/cursor_size:io_read(cursor_size:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/io_read(video_in:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/io_read(mouse_xy:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/io_read(vga_xy:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/io_write(video_out:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /vga_mouse_square/core/main/if:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/if:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/if:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/if:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/if:acc#7 CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/if:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/and CSTEPS_FROM {{.. == 1}}
directive set /vga_mouse_square/core/main/and#1 CSTEPS_FROM {{.. == 1}}
