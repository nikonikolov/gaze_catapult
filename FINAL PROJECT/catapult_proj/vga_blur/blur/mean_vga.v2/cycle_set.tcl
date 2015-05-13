
# Loop constraints
directive set /mean_vga/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /mean_vga/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /mean_vga/core/core:rlp/main/FRAME:io_read(vin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /mean_vga/core/core:rlp/main/ACC1:acc#39 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#38 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#47 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#37 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#36 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#46 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#51 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#35 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#34 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#45 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#33 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#32 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#44 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#50 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#53 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#43 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#49 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#42 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#52 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#41 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#40 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#48 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC2-5:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#62 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#61 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#70 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#60 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#59 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#69 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#74 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#58 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#57 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#68 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#56 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#55 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#67 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#73 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#76 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#54 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#66 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#65 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#72 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#64 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#63 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#71 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#75 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC2-5:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#85 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#84 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#93 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#83 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#82 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#92 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#97 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#81 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#80 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#91 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#79 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#78 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#90 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#96 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#99 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#77 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#89 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#88 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#95 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#87 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#86 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#94 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1:acc#98 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC2-5:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#7 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#13 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/acc CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#15 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#14 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#18 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#20 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#17 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#16 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#19 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/acc#2 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:mul#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#21 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#23 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#25 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#28 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#29 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/acc#3 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#22 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#24 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#26 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#27 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#31 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#30 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#34 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#36 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#33 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#32 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#35 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/acc#4 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:mul#2 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#37 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#39 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#41 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#44 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#45 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/acc#5 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#38 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#40 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#42 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#43 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:mul CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#46 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#48 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#50 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#53 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#54 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/acc#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#47 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#49 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#51 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#52 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:or CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:or#3 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:and CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc CSTEPS_FROM {{.. == 1}}