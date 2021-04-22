<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<meta charset="utf-8">
<html>
<head>
    <title>Tic-Tac-Toe Game Tree</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/static/js/underscore.js"></script>
<script src="${pageContext.request.contextPath}/static/js/backbone.js"></script>
<script src="${pageContext.request.contextPath}/static/js/d3.js"></script>
<script src="${pageContext.request.contextPath}/static/js/mauler-0.0.4.js"></script>
<script>

var margin = { top: 50, right: 50, bottom: 50, left: 50 },
width = 960 - margin.left - margin.right,
height = 500 - margin.top - margin.bottom,
nodeSize = 45;

var dfs = function(node) {
if (!node) {
    return;
}
var moves = node.game.moves();
// go to parent node
if (!moves.length || (node.children && node.children.length === moves.length)) {
    return dfs(node.parent);
}
else {
    if (!node.children) {
        node.children = [];
    }
    var child = {
        game: node.game.copy().move(node.children.length),
        parent: node,
        id: nodes.length
    };
    node.children.push(child);
    return child;
}
};

var ticTacToe = new ma.games.TicTacToe({
board: [['X', 'O', ' '],
	    [' ', 'O', ' '],
	    ['O', 'X', 'X']]
});

var svgView = new ma.views.TicTacToeSVG({
model: ticTacToe,
sideLength: nodeSize
});

var diagonal = d3.svg.diagonal()
.projection(function(d) { return [d.x, d.y]; });

var svg = d3.select("body")
.append("svg")
.attr("width", width + margin.left + margin.right)
.attr("height", height + margin.top + margin.bottom)
.attr("style", "background-color: #eeeeee")
.append("g")
.attr("transform", "translate(" + margin.left + ", " + margin.top + ")");

var tree = d3.layout.tree().size([width, height]);

tree.separation(function(a, b) {
return 2;
});

var root = { game: ticTacToe, id: 0 },
nodes = tree(root);

root.px = root.x;
root.py = root.y;

var currentNode = root;

var update = function() {
if (!currentNode) {
    return clearInterval(timer);
}

nodes.push(currentNode);

// Enter nodes
svg.selectAll(".node-group")
    .data(tree.nodes(root), function(d) {
        return d.id;
    })
    .enter()
    .append("g")
    .attr("class", "node-group")
    .attr("transform", function(d) {
        svgView.model = d.game;
        svgView.svg = d3.select(this);
        svgView.render();
        if (!d.parent) {
            return "translate(" + ((width / 2) - (nodeSize / 2)) + ", " + (0 - (nodeSize / 2)) + ")";
        }
        return "translate(" + (d.parent.px - (nodeSize / 2)) + ", " + (d.parent.py - (nodeSize / 2)) + ")";
    });

// Enter links
svg.selectAll(".link")
    .data(tree.links(nodes), function(d) {
        return d.source.id + "-" + d.target.id;
    })
    .enter()
    .insert("path", ".node-group")
    .attr("class", "link")
    .attr("d", function(d) {
        var o = {
            x: d.source.px,
            y: d.source.py
        };
        return diagonal({
            source: o,
            target: o
        });
    })
    .attr("fill", "none")
    .attr("stroke", "#666666")
    .attr("stroke-width", 2);

var t = svg.transition().duration(250);

// Update links
t.selectAll(".link")
    .attr("d", diagonal);

// Update nodes
t.selectAll(".node-group")
    .attr("transform", function(d) {
        d.px = d.x;
        d.py = d.y;
        return "translate(" + (d.x - (nodeSize / 2)) + ", " + (d.y - (nodeSize / 2)) + ")"
    });

currentNode = dfs(currentNode);
};

var duration = 1000,
timer = setInterval(update, duration);
</script>
</body>
<a href="/exercises/show/${visualization.exerciseId}">Go back to exercise</a>
</html>