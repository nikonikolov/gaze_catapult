
# Loop constraints
directive set /dot_product/core/main CSTEPS_FROM {{. == 6}}

# IO operation constraints
directive set /dot_product/core/main/MAC:io_read(input_a:rsc.d)#3 CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:io_read(input_b:rsc.d)#3 CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC:io_read(input_a:rsc.d)#4 CSTEPS_FROM {{.. == 2}}
directive set /dot_product/core/main/MAC:io_read(input_b:rsc.d)#4 CSTEPS_FROM {{.. == 2}}
directive set /dot_product/core/main/MAC:io_read(input_a:rsc.d) CSTEPS_FROM {{.. == 3}}
directive set /dot_product/core/main/MAC:io_read(input_b:rsc.d) CSTEPS_FROM {{.. == 3}}
directive set /dot_product/core/main/MAC:io_read(input_a:rsc.d)#1 CSTEPS_FROM {{.. == 4}}
directive set /dot_product/core/main/MAC:io_read(input_b:rsc.d)#1 CSTEPS_FROM {{.. == 4}}
directive set /dot_product/core/main/MAC:io_read(input_a:rsc.d)#2 CSTEPS_FROM {{.. == 5}}
directive set /dot_product/core/main/MAC:io_read(input_b:rsc.d)#2 CSTEPS_FROM {{.. == 5}}
directive set /dot_product/core/main/io_write(output:rsc.d) CSTEPS_FROM {{.. == 5}}

# Real operation constraints
directive set /dot_product/core/main/MAC-4:mul CSTEPS_FROM {{.. == 1}}
directive set /dot_product/core/main/MAC-5:mul CSTEPS_FROM {{.. == 2}}
directive set /dot_product/core/main/MAC:acc#6 CSTEPS_FROM {{.. == 2}}
directive set /dot_product/core/main/MAC-1:mul CSTEPS_FROM {{.. == 3}}
directive set /dot_product/core/main/MAC:acc CSTEPS_FROM {{.. == 3}}
directive set /dot_product/core/main/MAC-2:mul CSTEPS_FROM {{.. == 4}}
directive set /dot_product/core/main/MAC-3:mul CSTEPS_FROM {{.. == 5}}
directive set /dot_product/core/main/MAC:acc#5 CSTEPS_FROM {{.. == 5}}
directive set /dot_product/core/main/MAC-5:acc#3 CSTEPS_FROM {{.. == 5}}
