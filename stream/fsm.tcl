# wave.tcl: TCL script for GTKWave simulator with signal definitions 
# Author(s): Lukas Kekely (ikekely@fit.vutbr.cz)

gtkwave::/Edit/Insert_Comment "Main Interface"
gtkwave::addSignalsFromList [list clk rst]
gtkwave::/Edit/Color_Format/Blue
gtkwave::addSignalsFromList [list cur_state next_state A B C D E]
gtkwave::/Edit/Insert_Blank

gtkwave::/Edit/Insert_Comment "Other Signals"
         # <<< TODO: Insert 'gtkwave::addSignalsFromList' for your signals here.

gtkwave::/Edit/UnHighlight_All
gtkwave::/Time/Zoom/Zoom_Best_Fit
