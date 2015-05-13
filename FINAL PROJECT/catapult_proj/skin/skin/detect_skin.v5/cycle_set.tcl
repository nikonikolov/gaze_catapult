
# Loop constraints
directive set /detect_skin/core/main CSTEPS_FROM {{. == 2}}

# IO operation constraints
directive set /detect_skin/core/main/io_read(pixin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/if:io_write(pixout:rsc.d)#1 CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /detect_skin/core/main/mul#9 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul#3 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc#9 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul#10 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc#2 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc#4 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul#13 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul#12 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc#10 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul#11 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc#5 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc#7 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/if:acc CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/aif:acc CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/if:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/aif#3:acc CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul#1 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/mul#2 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/acc#1 CSTEPS_FROM {{.. == 1}}
directive set /detect_skin/core/main/aif#5:acc CSTEPS_FROM {{.. == 1}}
