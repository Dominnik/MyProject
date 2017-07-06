
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!--//////////////////////////////////////////////////////////////////////////-->

<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/style1.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/screen.css"/>
  <title>taskTracker</title>


</head>

<body>



<script type="text/javascript">
    var lastResFind=""; // последний удачный результат
    var copy_page=""; // копия страницы в ихсодном виде
    function TrimStr(s) {
        s = s.replace( /^\s+/g, '');
        return s.replace( /\s+$/g, '');
    }
    function FindOnPage(inputId) {//ищет текст на странице, в параметр передается ID поля для ввода
        var obj = window.document.getElementById(inputId);
        var textToFind;

        if (obj) {
            textToFind = TrimStr(obj.value);//обрезаем пробелы
        } else {
            alert("Введенная фраза не найдена");
            return;
        }
        if (textToFind == "") {
            alert("Вы ничего не ввели");
            return;
        }

        if(document.body.innerHTML.indexOf(textToFind)=="-1")
            alert("Ничего не найдено, проверьте правильность ввода!");

        if(copy_page.length>0)
            document.body.innerHTML=copy_page;
        else copy_page=document.body.innerHTML;


        document.body.innerHTML = document.body.innerHTML.replace(eval("/name="+lastResFind+"/gi")," ");//стираем предыдущие якори для скрола
        document.body.innerHTML = document.body.innerHTML.replace(eval("/"+textToFind+"/gi"),"<a name="+textToFind+" style='background:red'>"+textToFind+"</a>"); //Заменяем найденный текст ссылками с якорем;
        lastResFind=textToFind; // сохраняем фразу для поиска, чтобы в дальнейшем по ней стереть все ссылки
        window.location = '#'+textToFind;//перемещаем скрол к последнему найденному совпадению
    }
</script>



<input type="text" id="text-to-find" placeholder="Поиск...">
<input type="button" onclick="javascript: FindOnPage('text-to-find'); return false;" value="Искать"/>
<hr/>

<table border='2' cellpadding='20' bgcolor="aqua">
    <tr><th>Категории</th></tr>
    <tr><td>категория1</td></tr>
    <tr><td>категория2</td></tr>
    <tr><td>категория3</td></tr>
    <tr><td>категория4</td></tr>
    <tr><td>категория5</td></tr>
</table>
</body>

<body>

<div class="span-6" id="contentwrap">
    <div class="span-3">
        <div class="sidebar">

            <ul>

            <li><h2>Категории</h2>
                <ul>
                    <li><h3>Внимание!</br>Проект ищет спонсоров!</h3></li>
                </ul></li>

            </ul>
        </div></div>




<spring:form method="post"  modelAttribute="userJSP" action="check-user">

  Name: <spring:input path="name"/> (path="" - указывает путь, используемый в modelAttribute=''. в нашем случае User.name)  <br/>
  Password: <spring:input path="password"/>   <br/>
  <spring:button>Next Page</spring:button>

</spring:form>

</body>



</html>

