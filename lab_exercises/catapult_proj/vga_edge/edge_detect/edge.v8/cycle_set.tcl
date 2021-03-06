
# Loop constraints
directive set /edge/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /edge/core/core:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /edge/core/core:rlp/main/SHIFT:if:else:else:if:io_read(vin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /edge/core/core:rlp/main/FRAME:io_write(vout:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /edge/core/core:rlp/main/ACC2:acc#5 CSTEPS_FROM {{.. == 1}}
