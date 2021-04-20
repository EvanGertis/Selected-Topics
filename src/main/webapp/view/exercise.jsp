<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
    prefix="fn" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<html>
<head>
    <title>Exercise</title>
    <link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.1/styles/default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <div>
        <h1>${exercise.question}</h1>
        <c:if test="${fn:contains(exercise.exercise, 'PNG')}">
        	<img src="${pageContext.request.contextPath}/static/images/${exercise.exercise}/"/>
        </c:if>
        <c:if test="${fn:contains(exercise.exercise, 'txt')}">
       		<iframe class="editor language-java" src="/${exercise.exercise}/"></iframe>
        </c:if>
        <ul class="answers" exercise-id="${exercise.id}">
        	<label>Please click on an answer to see if your selection is correct.</label>
            <li id="a" value="1">${exercise.one}</li>
            <li id="b" value="2">${exercise.two}</li>
            <li id="c" value="3">${exercise.three}</li>
        </ul>
        <c:if test="${exercise.hasVisualization}">
        	<a href="/visualization/show/${exercise.id}">click here to see a visualization</a>
        </c:if>
        <a href="/chapter/show/${exercise.chapterId}">Go back to chapter</a>
    </div>
</body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.1/highlight.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>
