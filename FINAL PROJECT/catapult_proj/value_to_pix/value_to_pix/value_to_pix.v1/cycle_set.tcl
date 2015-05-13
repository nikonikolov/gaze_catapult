
# Loop constraints
directive set /value_to_pix/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /value_to_pix/core/main/io_read(vin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /value_to_pix/core/main/if:io_write(pixout:rsc.d)#1 CSTEPS_FROM {{.. == 1}}

# Real operation constraints
