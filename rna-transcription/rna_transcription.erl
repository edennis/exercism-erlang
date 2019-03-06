-module(rna_transcription).
-export([to_rna/1]).

to_rna(Strand) ->
  lists:reverse(transcribe(Strand, [])).

transcribe([], Acc) -> Acc;
transcribe([H | T], Acc) ->
  transcribe(T, [complement(H) | Acc]).

complement($G) -> $C;
complement($C) -> $G;
complement($T) -> $A;
complement($A) -> $U.
