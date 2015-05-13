# ----------------------------------------------------------------------------
# Original Design + Testbench
#
#    HLS version: 2011a.126 Production Release
#       HLS date: Wed Aug  8 00:52:07 PDT 2012
#  Flow Packages: HDL_Tcl 2008a.1, SCVerify 2009a.1
#
#   Generated by: nn1114@EEWS104A-001
# Generated date: Tue Mar 03 15:03:46 +0000 2015
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
SOLNDIR           = $(subst /,$(PATHSEP),dot_product/dot_product.v3)
export MGC_HOME

# Variables that can be overridden from the make command line
ifeq "$(INCL_DIRS)" ""
INCL_DIRS                   =  .
endif
export INCL_DIRS
ifeq "$(STAGE)" ""
STAGE                       = orig
endif
export STAGE
ifeq "$(SIMTOOL)" ""
SIMTOOL                     = osci
endif
export SIMTOOL
ifeq "$(NETLIST)" ""
NETLIST                     = cxx
endif
export NETLIST
ifeq "$(RTL_NETLIST_FNAME)" ""
RTL_NETLIST_FNAME           = H:/LABPRO~1/dot_product/dot_product/dot_product.v3/dummy_netlist_file
endif
export RTL_NETLIST_FNAME
ifeq "$(TARGET)" ""
TARGET                      = scverify/$(STAGE)_$(NETLIST)_$(SIMTOOL)
endif
export TARGET
ifeq "$(INVOKE_ARGS)" ""
INVOKE_ARGS                 = 
endif
export INVOKE_ARGS
export SCVLIBS
LINK_SYSTEMC             += true
TOP_HDL_ENTITY           += dot_product
TOP_DU                   += scverify_top
LINK_SYSTEMC             += true

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
GATE_VLOG_DEP = 
endif
endif
VHDL_SRC =  $(GATE_VHDL_DEP)
VLOG_SRC =  $(GATE_VLOG_DEP)
else
VHDL_SRC = 
VLOG_SRC = 
endif
CXX_SRC  = ../../../student_files_2015/prj1/dot_product_source/dot_product.cpp/dot_product.cpp.cxxts ../../../student_files_2015/prj1/dot_product_source/tb_dot_product.cpp/tb_dot_product.cpp.cxxts
# Specify RTL synthesis scripts (if any)
RTL_SCRIPT = 

# Specify hold time file name (for verifying synthesized netlists)
HLD_CONSTRAINT_FNAME = top_gate_constraints.cpp

# ===================================================
# GLOBAL OPTIONS
# 
# CXXFLAGS - global C++ options (apply to all C++ compilations) except for include file search paths
CXXFLAGS += -DSC_INCLUDE_DYNAMIC_PROCESSES -DSC_USE_STD_STRING -DTOP_HDL_ENTITY=$(TOP_HDL_ENTITY) /W3 -DCCS_MISMATCHED_OUTPUTS_ONLY
# 
# If the make command line includes a definition of the special variable MC_DEFAULT_TRANSACTOR_LOG
# then define that value for all compilations as well
ifneq "$(MC_DEFAULT_TRANSACTOR_LOG)" ""
CXXFLAGS += -DMC_DEFAULT_TRANSACTOR_LOG=$(MC_DEFAULT_TRANSACTOR_LOG)
endif
# 
# CXX_INCLUDES - include file search paths
CXX_INCLUDES = . ../..
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
$(TARGET)/dot_product.cpp.cxxts: ../../../student_files_2015/prj1/dot_product_source/dot_product.cpp
$(TARGET)/tb_dot_product.cpp.cxxts: ../../../student_files_2015/prj1/dot_product_source/tb_dot_product.cpp
# 
# Specify additional C++ options per C++ source by setting CXX_OPTS
$(TARGET)/dot_product.cpp.cxxts: CXX_OPTS=
$(TARGET)/tb_dot_product.cpp.cxxts: CXX_OPTS=
# 
# Specify dependencies
$(TARGET)/dot_product.cpp.cxxts: 
$(TARGET)/tb_dot_product.cpp.cxxts: 
# 
# Specify compilation library for HDL source
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

ifneq "$(RTLTOOL)" ""
# ===================================================
# Include makefile for RTL synthesis
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(RTLTOOL).mk
else
# ===================================================
# Include makefile for simulator
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(SIMTOOL).mk
endif

