<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 23.09.2020
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="headerLogin.jsp"%>
<section class="text-gray-700 body-font">
    <div class="container px-5 py-24 mx-auto flex flex-wrap items-center">
        <div class="lg:w-3/5 md:w-1/2 md:pr-16 lg:pr-0 pr-0">
            <h1 class="title-font font-medium text-3xl text-gray-900">DadCLoud Online Repository</h1>
            <p class="leading-relaxed mt-4">Mange your files and directories in easy way</p>
        </div>
        <div class="lg:w-2/6 md:w-1/2 bg-gray-200 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0" id="regg" >
            <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Sign Up</h2>

            <%--Register Form--%>
            <form method="post" action="${pageContext.request.contextPath}/signUp">
                <input class="bg-white rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2 mb-4" placeholder="Full Name" type="text" name="fullName">
                <input class="bg-white rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2 mb-4" placeholder="Email" type="email" name="email">
                <input class="bg-white rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2 mb-4" placeholder="Password" type="password" name="password"><br>
                <button type="submit" class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Button</button>
            </form>
            <p class="text-xs text-gray-500 mt-3">If you already have an account, please <a href="login.jsp" style="background-color: cornflowerblue; color: white">Sign in</a></p>
        </div>
    </div>
</section>
</body>
</html>
