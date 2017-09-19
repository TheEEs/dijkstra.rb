# An implementation of Dijkstra algorithm written in Ruby

## 1. Set up your graph

First, you need to setup the graph so that you can use this later. A graph is a collections of vertexes and adge

To setup a node

```ruby
A= Node::new"A" #"A" is the name of this node.
```

After having all nodes in your graph, let's connect them together. By using 

```ruby
A.connect_to_node B,2
```

You have connected node A to node B, with weight of 2. Notice that a connection is just a one-direction way. You might must connect node `B` to `A` if you could return to `A` from `B`.

Our example will use the bellow graph:

![Cannot load the image](http://sv1.upsieutoc.com/2017/09/19/graph_dij4.png)

With this graph, we can easily setup our code:

```ruby
A=Node::new"A"
B=Node::new"B"
C=Node::new"C"
D=Node::new"D"
E=Node::new"E"
F=Node::new"F"
G=Node::new"G"
H=Node::new"H"
I=Node::new"I"
J=Node::new"J"

##setup the connections

A.connect_to_node E,1
A.connect_to_node H,10


B.connect_to_node C,2

D.connect_to_node H,1
D.connect_to_node A,4


E.connect_to_node F,3

F.connect_to_node B,1
F.connect_to_node G,7
F.connect_to_node I,1

H.connect_to_node I,9
H.connect_to_node E,5


I.connect_to_node J,2

J.connect_to_node G,1

```



This code provide you a class called `Rabbit`. This rabbit will jump to all nodes of the graph. Just give him a starting point, after that you can ask him the shortest way to traverse to any node on the graph.



```ruby
rb= Rabbit.new D
rb.run# you must call this method to ask him for jumping
```



After our rabbit has finished his journey, you can as for the shortest path to go to a node. For example:

```ruby
puts G.the_shortest_way
```

will print out `D->A->E->F->I->J->G`.



Enjoy. Thanks you.