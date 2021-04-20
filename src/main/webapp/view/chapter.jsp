<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book</title>
    <link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.1/styles/default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <div>
        <h1>${chapter.getTitle()}</h1>
    </div>
    <ul id="exercises" chapter-id="${chapter.getId()}"></ul>
    <a href="/avs/show/${chapter.avId}">Go back to Algorithm Visualizations</a>
</body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.1/highlight.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/chapter.js"></script>
