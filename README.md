# F3DEX
Matching and mostly documented disassemblies of the F3DEX N64 RSP microcode family.

# Call graph
```sequence
wait_for_dma_and_run_next_command -> while_wait_dma_busy
wait_for_dma_and_run_next_command -> dispatch_task: if first 2 bits are not null
```