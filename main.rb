#an implementation of Dijkstra's algothirm written in Ruby
class Node
    attr_accessor  :name, :paths, :shortest_distance, :how_to_come_to_me
    def initialize name=""
        self.shortest_distance= Float::INFINITY
        self.paths= []
        self.how_to_come_to_me = []
        self.name = name;
    end    
    def connect_to_node node, weight
        self.paths<<(
            Path.new(node,weight)
        )
    end

    def the_shortest_way
        if self.how_to_come_to_me.empty?
            "there is no way to go #{self.name}"  
        else
            self.how_to_come_to_me.join '->'
        end
    end
end
class Path
    attr_accessor  :to_node, :weight
    def initialize to, weight
        #self.from_node = from
        self.to_node= to
        self.weight= weight
    end
    alias node to_node
end

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


class Rabbit
    def initialize entry_point
        @current_node=entry_point
    end

    def run
        @current_node.shortest_distance = 0
        @nodes_to_visit=[@current_node]
        @current_node.how_to_come_to_me << @current_node.name
        @temp=[]
        begin
            @temp.clear
            @nodes_to_visit.each do |node|
                node.paths.each do |path|
                        (path.node.shortest_distance = node.shortest_distance + path.weight
                        path.node.how_to_come_to_me = node.how_to_come_to_me.clone<<path.node.name
                        ) if (node.shortest_distance + path.weight) < path.node.shortest_distance
                        @temp<<path.node
                        path.node.paths.select!{|p|
                            p.node.name != node.name
                        }
                        #puts path.node.paths
                end#do
                    #print @temp,"\n"
            end#do
            @nodes_to_visit = @temp.clone
        end until @nodes_to_visit.empty?
    end
end

a=Rabbit::new H
a.run
puts G.the_shortest_way