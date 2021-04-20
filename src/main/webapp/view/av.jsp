<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Algorithm Visualizations</title>
    <link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.1/styles/default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <div>
        <h1>${av.getTitle()}</h1>
        <ul>
        	<li>${av.getAuthor()}</li>
        </ul> 
        <ul id="chapters" av-id="${av.getId()}">
        </ul>
    </div>
</body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.1/highlight.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/av.js"></script>
