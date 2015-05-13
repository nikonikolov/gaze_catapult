# ----------------------------------------------------------------------------
# Gate Verilog output 'gate.v' vs Untimed C++
#
#    HLS version: 2011a.126 Production Release
#       HLS date: Wed Aug  8 00:52:07 PDT 2012
#  Flow Packages: HDL_Tcl 2008a.1, SCVerify 2009a.1
#
#   Generated by: nn1114@EEWS104A-002
# Generated date: Fri Mar 06 14:58:22 +0000 2015
#
# ----------------------------------------------------------------------------
# ===================================================
# DEFAULT GOAL is the help target
.PHONY: all
all: help

# ===================================================
# VARIABLES
# 
MGC_HOME          = C:/PROGRA~1/CALYPT~1/CATAPU~1.126/Mgc_home
PROJDIR           = $(subst /,$(PATHSEP),../..)
SOLNDIR           = $(subst /,$(PATHSEP),dot_product/dot_product.v9)
export MGC_HOME

# Variables that can be overridden from the make command line
ifeq "$(INCL_DIRS)" ""
INCL_DIRS                   = ./scverify . ../..
endif
export INCL_DIRS
ifeq "$(STAGE)" ""
STAGE                       = gate
endif
export STAGE
ifeq "$(SIMTOOL)" ""
SIMTOOL                     = msim
endif
export SIMTOOL
ifeq "$(NETLIST)" ""
NETLIST                     = v
endif
export NETLIST
ifeq "$(RTL_NETLIST_FNAME)" ""
RTL_NETLIST_FNAME           = H:/LABPRO~1/dot_product/dot_product/dot_product.v9/rtl.v
endif
export RTL_NETLIST_FNAME
ifeq "$(TARGET)" ""
TARGET                      = scverify/$(STAGE)_$(NETLIST)_$(SIMTOOL)
endif
export TARGET
ifeq "$(RTLTOOL)" ""
RTLTOOL                     = psr
endif
export RTLTOOL
ifeq "$(INVOKE_ARGS)" ""
INVOKE_ARGS                 = 
endif
export INVOKE_ARGS
export SCVLIBS
export MODELSIM
TOP_HDL_ENTITY           += dot_product
TOP_DU                   += scverify_top
CXX_TYPE                 += gcc
MSIM_SCRIPT              += ./dot_product/dot_product.v9/scverify_msim.tcl

ifeq ($(RECUR),)
ifeq ($(STAGE),mapped)
ifeq ($(RTLTOOL),)
   $(error This makefile requires specifying the RTLTOOL variable on the make command line)
endif
endif
endif
# ===================================================
# Include makefile for default commands and variables
include $(MGC_HOME)/shared/include/mkfiles/ccs_default_cmds.mk

# ===================================================
# Include environment variables set by flow options
include ./ccs_env.mk

# ===================================================
# Include auxillary makefiles based on simulation flows
include $(MGC_HOME)/shared/include/mkfiles/ccs_Altera.mk

# ===================================================
# SOURCES
# 
# Specify list of Modelsim libraries to create
HDL_LIB_NAMES = work
# Specify list of source files - MUST be ordered properly
ifeq ($(STAGE),gate)
ifeq ($(RTLTOOL),)
ifeq ($(GATE_VHDL_DEP),)
GATE_VHDL_DEP = 
endif
ifeq ($(GATE_VLOG_DEP),)
GATE_VLOG_DEP = H:/LABPRO~1/dot_product/dot_product/dot_product.v9/gate.v/gate.v.vts
endif
endif
VHDL_SRC =  $(GATE_VHDL_DEP)
VLOG_SRC =  $(GATE_VLOG_DEP)
else
VHDL_SRC = 
VLOG_SRC = H:/LABPRO~1/dot_product/dot_product/dot_product.v9/gate.v/gate.v.vts
endif
CXX_SRC  = ../../../student_files_2015/prj1/dot_product_source/dot_product.cpp/dot_product.cpp.cxxts ../../../student_files_2015/prj1/dot_product_source/tb_dot_product.cpp/tb_dot_product.cpp.cxxts H:/LABPRO~1/dot_product/dot_product/dot_product.v9/scverify/mc_testbench.cpp/mc_testbench.cpp.cxxts H:/LABPRO~1/dot_product/dot_product/dot_product.v9/scverify/scverify_top.cpp/scverify_top.cpp.cxxts H:/LABPRO~1/dot_product/dot_product/dot_product.v9/top_gate_constraints.cpp/top_gate_constraints.cpp.cxxts
# Specify RTL synthesis scripts (if any)
RTL_SCRIPT = H:/LABPRO~1/dot_product/dot_product/dot_product.v9/scverify/gate.psrv

# Specify hold time file name (for verifying synthesized netlists)
HLD_CONSTRAINT_FNAME = top_gate_constraints.cpp

# ===================================================
# GLOBAL OPTIONS
# 
# CXXFLAGS - global C++ options (apply to all C++ compilations) except for include file search paths
CXXFLAGS += -DCCS_SCVERIFY -DSC_INCLUDE_DYNAMIC_PROCESSES -DSC_USE_STD_STRING -DSC_INCLUDE_MTI_AC -DTOP_HDL_ENTITY=$(TOP_HDL_ENTITY) -DCCS_MISMATCHED_OUTPUTS_ONLY
# 
# If the make command line includes a definition of the special variable MC_DEFAULT_TRANSACTOR_LOG
# then define that value for all compilations as well
ifneq "$(MC_DEFAULT_TRANSACTOR_LOG)" ""
CXXFLAGS += -DMC_DEFAULT_TRANSACTOR_LOG=$(MC_DEFAULT_TRANSACTOR_LOG)
endif
# 
# CXX_INCLUDES - include file search paths
CXX_INCLUDES = ./scverify . ../..
# 
# TCL shell
TCLSH_CMD = $(MGC_HOME)/bin/tclsh85.exe

# Pass along SCVerify_DEADLOCK_DETECTION option
ifneq "$(SCVerify_DEADLOCK_DETECTION)" ""
CXXFLAGS += -DDEADLOCK_DETECTION
endif
# ===================================================
# PER SOURCE FILE SPECIALIZATIONS
# 
# Specify source file paths
ifeq ($(STAGE),gate)
ifneq ($(GATE_VHDL_DEP),)
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): $(dir $(GATE_VHDL_DEP))
endif
ifneq ($(GATE_VLOG_DEP),)
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): $(dir $(GATE_VLOG_DEP))
endif
endif
$(TARGET)/gate.v.vts: H:/LABPRO~1/dot_product/dot_product/dot_product.v9/gate.v
$(TARGET)/dot_product.cpp.cxxts: ../../../student_files_2015/prj1/dot_product_source/dot_product.cpp
$(TARGET)/tb_dot_product.cpp.cxxts: ../../../student_files_2015/prj1/dot_product_source/tb_dot_product.cpp
$(TARGET)/mc_testbench.cpp.cxxts: H:/LABPRO~1/dot_product/dot_product/dot_product.v9/scverify/mc_testbench.cpp
$(TARGET)/scverify_top.cpp.cxxts: H:/LABPRO~1/dot_product/dot_product/dot_product.v9/scverify/scverify_top.cpp
$(TARGET)/top_gate_constraints.cpp.cxxts: H:/LABPRO~1/dot_product/dot_product/dot_product.v9/top_gate_constraints.cpp
# 
# Specify additional C++ options per C++ source by setting CXX_OPTS
$(TARGET)/dot_product.cpp.cxxts: CXX_OPTS=
$(TARGET)/top_gate_constraints.cpp.cxxts: CXX_OPTS=
$(TARGET)/scverify_top.cpp.cxxts: CXX_OPTS=
$(TARGET)/mc_testbench.cpp.cxxts: CXX_OPTS=
$(TARGET)/tb_dot_product.cpp.cxxts: CXX_OPTS=
# 
# Specify dependencies
$(TARGET)/dot_product.cpp.cxxts: 
$(TARGET)/tb_dot_product.cpp.cxxts: 
$(TARGET)/mc_testbench.cpp.cxxts: 
$(TARGET)/scverify_top.cpp.cxxts: 
$(TARGET)/top_gate_constraints.cpp.cxxts: 
# 
# Specify compilation library for HDL source
$(TARGET)/gate.v.vts: HDL_LIB=work
ifeq ($(STAGE),gate)
ifneq ($(GATE_VHDL_DEP),)
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): HDL_LIB=work
endif
ifneq ($(GATE_VLOG_DEP),)
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): HDL_LIB=work
endif
endif
# 
# Specify top design unit for HDL source

# Specify top design unit
$(TARGET)/gate.v.vts: VLOG_TOP=1

ifneq "$(RTLTOOL)" ""
# ===================================================
# Include makefile for RTL synthesis
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(RTLTOOL).mk
else
# ===================================================
# Include makefile for simulator
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(SIMTOOL).mk
endif

