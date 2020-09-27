<%@ page import="models.User" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 15.09.2020
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<header class="text-gray-700 body-font">
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
            <img src="${pageContext.request.contextPath}/jsp/img/cloud.png" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
            <span class="ml-3 text-xl">DadCloud</span>
        </a>
        <nav class="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
            <a class="mr-5 hover:text-gray-900" href="${pageContext.request.contextPath}/jsp/main.jsp">Main</a>
            <a class="mr-5 hover:text-gray-900" href="${pageContext.request.contextPath}/LoadUserFiles">All files</a>
            <a class="mr-5 text-white" href="${pageContext.request.contextPath}/LoadUserFiles">All files</a>

        </nav>
        <a href="${pageContext.request.contextPath}/Logout" class="inline-flex items-center bg-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-gray-300 rounded text-base mt-4 md:mt-0">
            <img src="${pageContext.request.contextPath}/jsp/img/logout.png" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
        </a>
    </div>
</header>
