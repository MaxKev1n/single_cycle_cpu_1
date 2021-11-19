onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib scdatamem_opt

do {wave.do}

view wave
view structure
view signals

do {scdatamem.udo}

run -all

quit -force
