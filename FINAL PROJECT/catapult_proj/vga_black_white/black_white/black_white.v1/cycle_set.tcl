
# Loop constraints
directive set /black_white/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /black_white/core/main/io_write(output:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
