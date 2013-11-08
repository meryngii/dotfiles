
syn region texComment       start="\\begin{comment}"		end="\\end{comment}\|%stopzone\>"	contains=@Spell

syn region texZone start="\\begin{lstlisting}" end="\\end{lstlisting}\|%stopzone\>" contains=@Spell


