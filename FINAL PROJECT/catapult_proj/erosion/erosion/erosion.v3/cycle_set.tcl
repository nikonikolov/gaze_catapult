
# Loop constraints
directive set /erosion/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /erosion/core/core:rlp/main CSTEPS_FROM {{. == 1} {.. == 0}}
directive set /erosion/core/core:rlp/main/FRAME CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /erosion/core/core:rlp/main/FRAME/FRAME:io_read(vin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/FRAME:if:io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/FRAME:else:io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:if:mul CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:if:acc CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:if:mux CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:acc CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:acc CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:and#1 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/ACC1:for:mux#8 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/FRAME:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/FRAME:acc CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:if:else:else:else:acc CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:if:else:else:else:mux CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:and#2 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:and#3 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#8 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#9 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#10 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#11 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#12 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#13 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux1h#1 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#16 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux1h CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#19 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#22 CSTEPS_FROM {{.. == 1}}
directive set /erosion/core/core:rlp/main/FRAME/SHIFT:mux#15 CSTEPS_FROM {{.. == 1}}
