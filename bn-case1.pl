parent( L, G).
parent( K, G).
parent( G, J).
p( L, 0.4).
p( K, 0.8).
p( G, [ L, K], 1).
p( G, [ L, not(K)], 0.5).
p( G, [ not(L), K], 0.9).
p( G, [ not(L), not(K)], 0).
p( J, [ G], 0.9).
p( J, [ not(G)], 0.7).

