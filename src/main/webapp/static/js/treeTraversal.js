var m = {top: 20, right: 0, bottom: 20, left: 0},
  w = document.getElementById("tree-container").offsetWidth - m.right - m.left,
  h = document.getElementById("tree-container").offsetHeight - m.top - m.bottom;

var i=0, duration=500,root;

var tree = d3.layout.tree()
  .size([h, w]);


d3.selection.prototype.moveToFront = function() {  
  return this.each(function(){
    this.parentNode.appendChild(this);
  });
};

var svg = d3.select("#tree-container").append("svg")
  .attr("width", w + m.right + m.left)
  .attr("height", h + m.top + m.bottom)
  .append("g")
  .attr("transform", "translate(" + m.left + "," + m.top + ")");
  
root= treeData[0];
update(treeData[0]);

function reset(root){
  d3.selectAll(".node")
    .transition().duration(duration)
    .style("fill","#fff")
    .style("stroke","steelblue");

}

function update(root) {

  reset(root);

  var nodes = tree.nodes(root).reverse(),
    links = tree.links(nodes);

  nodes.forEach(function(d) { d.y = d.depth *100; });

  var nodeWrapper = svg.append("g").attr("id","nodes").selectAll("g.node")
    .data(nodes, function(d) {return d.id || (d.id = ++i); })
    .enter().append("circle")
    .attr("class", "node")
    .attr("id",function(d){return "node-"+d.id})
    .attr("cx",function(d){return d.x;})
    .attr("cy",function(d){return d.y;})
    .attr("r", 10);

  var linkWrapper = svg.append("g").attr("id","links").selectAll("path.link")
    .data(links, function(d) { return d.target.id; })
    .enter()
    .append("line", "g")
    .attr("class", "link")
    .attr("id",function(d){
      return d.source.id +"->"+ d.target.id;
    })
    .attr('x1', function(d){return d.source.x;})
    .attr('x2',function(d){return d.target.x;})
    .attr('y1',function(d){return d.source.y;})
    .attr('y2',function(d){return d.target.y;});

  d3.select("#nodes").moveToFront();

}
function visitElement(element,ax){
  d3.select("#node-"+element.id)
    .transition().duration(duration).delay(duration*ax)
    .style("fill","green").style("stroke","green");
}

function dfs_traversal(){
  var stack=[];
  var ax=0;
  stack.push(root);
  while(stack.length!==0){
    var element = stack.pop();
    visitElement(element,ax);
    ax=ax+1;
    if(element.children!==undefined){
      for(var i=0; i<element.children.length; i++){
        stack.push(element.children[element.children.length-i-1]);
      }
    }
  }
}

function bfs_traversal(){
  var frontier=[];
  var ax=0;
  frontier.push(root);
  while(frontier.length!==0){
    var element = frontier.shift();
    visitElement(element,ax);
    ax= ax+1;
    if(element.children!==undefined){
      for(var i=0; i<element.children.length; i++){
        frontier.push(element.children[i]);
      }
    }
  }
}