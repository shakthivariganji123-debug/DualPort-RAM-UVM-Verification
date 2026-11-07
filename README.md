# Parameterized Dual-Port RAM & UVM 1.2 Verification Environment

## Overview
Synthesizable Verilog RTL implementation and comprehensive UVM 1.2 verification testbench for a Parameterized Dual-Port RAM with independent clock domains.

## Features
- **RTL Design:** Supports concurrent read/write operations, configurable DATA_WIDTH and ADDR_WIDTH, and address boundary arbitration.
- **UVM Verification Components:**
  - `uvm_sequence_item`: Defines memory transactions (addr, data, write_enable).
  - `uvm_driver` & `uvm_monitor`: Pin-level interface driving and bus monitoring.
  - `uvm_scoreboard`: Golden memory array reference model for automated data integrity check.
- **RAL Methodology:** Validates both front-door (bus transactions) and back-door (direct DPI simulator access) memory operations.
- **Coverage:** Covergroups targeting read-after-write (RAW), write-after-read (WAR), and boundary memory address spaces.
