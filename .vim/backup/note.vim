HightLight
script type
utility
 
description
   Line mode
     <C-h><C-h>   Highlight current line
     <C-h><C-a>   Advance color for next line highlight
     <C-h><C-r>   Clear last line highlight

   Pattern mode
     <C-h><C-w>   Highlight word under cursor (whole word match)
     <C-h><C-l>    Highlight all lines having word under cursor (whole word match)
     <C-h><C-f>    Highlight word under cursor (partial word match)
     <C-h><C-k>   Highlight all lines having word under cursor (partial word match)
     <C-h><C-s>   Highlight last search pattern
     <C-h><C-j>    Highlight all lines having last search pattern
     <C-h><C-d>   Clear last pattern highlight

     <C-h><C-n>   Clear all highlights

   All above commands work in both normal & insert modes.
   <C-h><C-h> also works in visual mode. (Select desired lines & hit <C-h><C-h>)

 
install details
Copy highlight.vim to your .vim/plugin directory
 
