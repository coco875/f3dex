# F3DEX
Matching and mostly documented disassemblies of the F3DEX N64 RSP microcode family.

# Call graph
```mermaid
erDiagram
  wait_for_dma_and_run_next_command->while_wait_dma_busy
  wait_for_dma_and_run_next_command->dispatch_task: if the first two bits of the command are non null
  dispatch_task->run_next_DL_command: if it's 1
  dispatch_task->dispatch_imm: if it's 2
  dispatch_task->dispatch_rdp: if it's 3
```