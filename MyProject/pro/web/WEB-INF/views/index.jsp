<!-- обратите внимание на spring тэги -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--//////////////////////////////////////////////////////////////////////////-->

<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Дратути</title>


</head>

<body>

<div id="wrapper">
  <div id="container" class="container">
  </div>
</div>



<div id="header" class="span-6">
  <div id="search">

    <form method="get" id="searchform" action="index.html">
      <input type="text" value="Поиск" />
      <input type="image" src="images/search.gif" />
    </form>

  </div>
</div>


<spring:form method="post"  modelAttribute="userJSP" action="check-user">

  Name: <spring:input path="name"/> (path="" - указывает путь, используемый в modelAttribute=''. в нашем случае User.name)  <br/>
  Password: <spring:input path="password"/>   <br/>
  <spring:button>Next Page</spring:button>

</spring:form>

</body>

</html>
