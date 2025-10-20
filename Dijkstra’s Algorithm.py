import networkx as nx
import matplotlib.pyplot as plt
G=nx.Graph()

nodes = ['A', 'B', 'C', 'D', 'E']
G.add_nodes_from(nodes)

# Add weighted edges
edges = [
    ('A', 'B', 4),
    ('A', 'C', 2),
    ('B', 'C', 1),
    ('B', 'D', 5),
    ('C', 'D', 8),
    ('C', 'E', 10),
    ('D', 'E', 2)
]
G.add_weighted_edges_from(edges)

source = 'A'
target = 'E'
shortest_path = nx.dijkstra_path(G, source, target, weight='weight')
path_length = nx.dijkstra_path_length(G, source, target, weight='weight')

# Print results
print(f"Shortest path from {source} to {target}: {shortest_path}")
print(f"Path length: {path_length}")

# Visualize the graph
pos = nx.spring_layout(G)
nx.draw(G, pos, with_labels=True, node_color='lightyellow', node_size=500)
nx.draw_networkx_edge_labels(G, pos, edge_labels={(u, v): d['weight'] for u, v, d in G.edges(data=True)})
# Highlight shortest path
path_edges = list(zip(shortest_path, shortest_path[1:]))
nx.draw_networkx_edges(G, pos, edgelist=path_edges, edge_color='r', width=2)
plt.show()
