# F3DEX
Matching and mostly documented disassemblies of the F3DEX N64 RSP microcode family.

# Call graph
```mermaid
flowchart TD
  wait_for_dma_and_run_next_command-->while_wait_dma_busy
  wait_for_dma_and_run_next_command-->|if the first two bits of the command are non null| dispatch_task
  dispatch_task-->|if it's 1| run_next_DL_command
  dispatch_task-->|if it's 2| dispatch_imm
  dispatch_task-->|if it's 3| dispatch_rdp
```